package dwarka

import (
	"context"
	"strings"
	"time"

	"terraform-provider-dwarka/client/dwarka"

	"github.com/hashicorp/terraform-plugin-sdk/v2/diag"
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)

func resourceRoom() *schema.Resource {
	return &schema.Resource{
		CreateContext: resourceRoomCreate,
		ReadContext:   resourceRoomRead,
		UpdateContext: resourceRoomUpdate,
		DeleteContext: resourceRoomDelete,
		Schema: map[string]*schema.Schema{
			"building_id": {
				Type:     schema.TypeString,
				Required: true,
			},
			"floor_id": {
				Type:     schema.TypeString,
				Required: true,
			},
			"name": {
				Type:     schema.TypeString,
				Required: true,
			},
			"direction": {
				Type:     schema.TypeString,
				Required: true,
			},
			"description": {
				Type:     schema.TypeString,
				Required: true,
			},
		},
		Importer: &schema.ResourceImporter{
			State: schema.ImportStatePassthrough,
		},
	}
}

func resourceRoomCreate(ctx context.Context, d *schema.ResourceData, m interface{}) diag.Diagnostics {
	c := m.(*dwarka.Client)

	// Warning or errors can be collected in a slice type
	var diags diag.Diagnostics

	BuildingID := d.Get("building_id").(string)
	floorID := d.Get("floor_id").(string)
	room := dwarka.Room{
		Name:        d.Get("name").(string),
		Direction:   d.Get("direction").(string),
		Description: d.Get("description").(string),
	}

	b, err := c.CreateRoom(BuildingID, floorID, room)
	if err != nil {
		return diag.FromErr(err)
	}

	d.SetId(b.Name)

	resourceRoomRead(ctx, d, m)

	return diags
}

func resourceRoomRead(ctx context.Context, d *schema.ResourceData, m interface{}) diag.Diagnostics {
	c := m.(*dwarka.Client)

	// Warning or errors can be collected in a slice type
	var diags diag.Diagnostics

	buildingID := d.Get("building_id").(string)
	floorID := d.Get("floor_id").(string)
	roomID := d.Id()

	ids := strings.Split(roomID, ".")
	if len(ids) == 3 {
		buildingID = ids[0]
		floorID = ids[1]
		roomID = ids[2]
	}

	room, err := c.GetRoom(buildingID, floorID, roomID)
	if err != nil {
		return diag.FromErr(err)
	}

	d.SetId(roomID) // removing building.room from floorID (is this right to do?)
	if err := d.Set("building_id", buildingID); err != nil {
		return diag.FromErr(err)
	}
	if err := d.Set("floor_id", floorID); err != nil {
		return diag.FromErr(err)
	}
	if err := d.Set("name", room.Name); err != nil {
		return diag.FromErr(err)
	}
	if err := d.Set("direction", room.Direction); err != nil {
		return diag.FromErr(err)
	}
	if err := d.Set("description", room.Description); err != nil {
		return diag.FromErr(err)
	}

	return diags
}

func resourceRoomUpdate(ctx context.Context, d *schema.ResourceData, m interface{}) diag.Diagnostics {
	c := m.(*dwarka.Client)

	buildingID := d.Get("building_id").(string)
	floorID := d.Get("floor_id").(string)

	if d.HasChanges("name", "direction", "description") {
		room := dwarka.Room{
			Name:        d.Get("name").(string),
			Direction:   d.Get("direction").(string),
			Description: d.Get("description").(string),
		}

		_, err := c.UpdateRoom(buildingID, floorID, room)
		if err != nil {
			return diag.FromErr(err)
		}
	}

	return resourceRoomRead(ctx, d, m)
}

func resourceRoomDelete(ctx context.Context, d *schema.ResourceData, m interface{}) diag.Diagnostics {
	c := m.(*dwarka.Client)

	// Warning or errors can be collected in a slice type
	var diags diag.Diagnostics

	buildingID := d.Get("building_id").(string)
	floorID := d.Get("floor_id").(string)
	roomID := d.Get("name").(string)

	err := c.DeleteRoom(buildingID, floorID, roomID)
	if err != nil {
		return diag.FromErr(err)
	}

	// d.SetId("") is automatically called assuming delete returns no errors, but
	// it is added here for explicitness.
	d.SetId("")

	return diags
}
