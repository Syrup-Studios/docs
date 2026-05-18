# Plushie Friends Data Pack Guide

This guide explains how to create a data pack to add custom pre-defined plushies with unique textures and lore, and how to inject them into loot tables.

## Data Pack Structure

Your data pack must follow this exact folder structure:

```text
my_custom_plushies/
├── pack.mcmeta
└── data/
    └── mymodpack/
        ├── loot_tables/
        │   └── chests/
        │       └── abandoned_mineshaft.json
        └── plushies/
            └── salad_plushie.json
```

Replace `mymodpack` with your own unique namespace using lowercase letters.

---

## 1. Pack Metadata (pack.mcmeta)

Create a file named `pack.mcmeta` at the root of your data pack folder.

```json
{
  "pack": {
    "pack_format": 15,
    "description": "Custom Plushies Data Pack"
  }
}
```

---

## 2. Defining a Custom Plushie

Create a JSON file inside `data/<namespace>/plushies/`. The name of this file will be your plushie ID. 

Example file: `data/mymodpack/plushies/salad_plushie.json`

```json
{
  "owner_name": "SaladSyrup",
  "lore": [
    "This guy is a piece of Lettuce",
    "Why is the picture a goose"
  ]
}
```

### Fields
* `owner_name`: The Minecraft username of the player skin you want the plushie to display.
* `lore`: A list of text lines that will appear as a gray tooltip description under the plushie's name when hovering over the item.

---

## 3. Adding Plushies to Loot Tables

To make your pre-defined plushie drop from chests or blocks, you must use the custom loot function `plushie-friends:set_plushie` inside a loot table.

Example file overwriting the vanilla abandoned mineshaft chest: `data/minecraft/loot_tables/chests/abandoned_mineshaft.json`

```json
{
  "type": "minecraft:chest",
  "pools": [
    {
      "rolls": 1,
      "entries": [
        {
          "type": "minecraft:item",
          "name": "plushie-friends:plushie",
          "functions": [
            {
              "function": "plushie-friends:set_plushie",
              "id": "mymodpack:salad_plushie"
            }
          ]
        }
      ]
    }
  ]
}
```

### Loot Function Details
* `function`: Always set this to `plushie-friends:set_plushie`.
* `id`: The full resource identifier of your plushie definition file (`<namespace>:<plushie_id>`).
