# Asset Pipeline Instructions - Throne of Combat 1

## STEP 1: GENERATE GRAPHICS
1. Use the prompts in `docs/PROMPTS.md` with the recommended tools.
2. For 3D models, export as **.GLB** or **.FBX**.
3. For UI and VFX, export as **.PNG** with transparency.
4. For textures, ensure they are tiling (seamless).

## STEP 2: GENERATE ANIMATIONS
1. Upload your character's .FBX/GLB to [Mixamo](https://www.mixamo.com/).
2. Rig the character using the Auto-Rigger.
3. Search and apply animations matching the prompts in `docs/PROMPTS.md`.
4. Download the animations as .FBX (for Godot).

## STEP 3: IMPORT TO GODOT 4
1. Place 3D models in `scenes/characters/`.
2. Place textures in `assets/textures/`.
3. Place UI assets in `ui/assets/`.
4. Place VFX sprites in `vfx/sprites/`.
5. Godot will automatically import them. Ensure "Import as Scene" is selected for 3D models.

## STEP 4: CONNECTING ASSETS TO CODE
1. **Characters:** Open the generated character scripts (e.g., `Knight.gd`). Add `@onready` variables to reference the `AnimationPlayer` or `AnimationTree`.
2. **UI:** Assign the generated textures to the `TextureProgressBar` (Health/Mana) or `Button` nodes.
3. **VFX:** Create `GPUParticles3D` scenes in the `vfx/` folder and use the generated sprite sheets as textures.
4. **Environment:** Assign the stone and blood textures to the materials of your arena meshes.

## STEP 5: NAMING CONVENTIONS
- Scripts: `PascalCase.gd` (e.g., `CharacterBase.gd`)
- Scenes: `snake_case.tscn` (e.g., `knight_player.tscn`)
- Assets: `prefix_name_suffix` (e.g., `tex_stone_floor_diffuse.png`)
