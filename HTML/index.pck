GDPC                �                                                                      "   X   res://.godot/exported/133200997/export-1f99a6b2c6bc083cf54233ed7519089b-Astronaut.scn   �      �      �O�VD|�����    P   res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn08      �?      mNHj���-�`�3    P   res://.godot/exported/133200997/export-8983deb26aa580c1e8cfdf2626a973f8-door.scn       	      �a�cL,�]دN<��_    `   res://.godot/exported/133200997/export-fe59e16d86e347c02ec62b7a4e9f8615-astronaute_spawner.scn  @      �      k:�(���$��p��    ,   res://.godot/global_script_class_cache.cfg  �}      �       ����e&�)�/̧    L   res://.godot/imported/Astronaut.png-42c0d6916b16b162d4a2cf497896b6d4.ctex   �      �       �݉���A�T�b"��=    P   res://.godot/imported/Barre_oxygene.png-9591223e1cfd15bc3b188333ac7744a5.ctex   �      �       v��,�a�EOQf�]3    P   res://.godot/imported/Chrono_inside.png-7ce899315786f1b7d5b994033466c713.ctex   P      :      -�Q�:��^���{;�    P   res://.godot/imported/Chrono_outside.png-4fd69f4f4aba3437f2f3ff344cd19a0a.ctex  `            ��o�
�=q~�K
��/    L   res://.godot/imported/Door_close.png-6be3d3380bff0c508683e1de886a118c.ctex        \        F񵱟�����cz�    L   res://.godot/imported/Door_open.png-b01d1e69efb446a65dc29d10475331e7.ctex   @       r       G���� Ԍ��1��xi    H   res://.godot/imported/Outlet.png-4b38ede37460b7184cefed66c4aef419.ctex  �w      B      �1�p�L��;@*\Q�    D   res://.godot/imported/Tile.png-234d274035d91a842071fd1b6df51f5f.ctex�y      H      ��o��dbX�/���*�P    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�!      \      6(4�d=EQ�ǮVj,       res://.godot/uid_cache.bin  ��            ͏���s0��)�N�w�       res://Astronaut.gd          t      x(�Od��6�[��Հ{       res://Astronaut.png.import         �       ��/�ӝQ	����FL       res://Astronaut.tscn.remap   |      f       X�����3jx.���s        res://Barre_oxygene.png.import  �      �       �<��VFу+�W��        res://Chrono_inside.png.import  �      �       �U:��n��e�z'        res://Chrono_outside.png.import p      �       ��nd��⻈I�'X�       res://Door.gd   @      �      )z�@b�3�����X�#�       res://Door_close.png.import p      �       m?��+�ģ\͍�V�       res://Door_open.png.import  �       �       ��9Ő喷��;"��       res://Outlet.png.import y      �       +��K�Җ��-���       res://Tile.png.import   0{      �       B�U�j590N��
o�k       res://astronaute_spawner.gd �      �      Q���K,�c|�z    $   res://astronaute_spawner.tscn.remap p|      o       ?A�+�����J��{�       res://door.tscn.remap   �|      a       A �S��˘�=�K/��       res://icon.svg  @~      N      ]��s�9^w/�����       res://icon.svg.import   �.      �       #�0��Aʓ���q��~       res://main.gd   �/      l      %�6d1�����wϑ       res://main.tscn.remap   P}      a       �J�Sw� ������       res://project.binary��      4      �Y�n��AJ��G    �V=V���extends Sprite2D

@export var direction : Vector2i
var dead = false
var cooldown = 0.5
var count = 0
var max_oxygene = 30
var oxygene = max_oxygene
@export var cell : Vector2i
@export var mainscene : Main

func _process(delta):
	oxygene -= delta
	if oxygene < 0 and not(dead):
		dead = true
		mainscene.on_death()
		count = 3
	if dead :
		if count >0 :
			count -= delta
		else :
			self.queue_free()
		return
	update_oxygene()
	count += delta
	if count >cooldown :
		count -= cooldown
		move()

func init(init_cell : Vector2i, init_main : Main):
	cell = init_cell
	mainscene = init_main
	mainscene.connect("stopall", queue_free)

func update_cell(new_cell :Vector2i):
	direction = new_cell - cell
	cell = new_cell;
	position = mainscene.grid_to_pos(new_cell)

func update_oxygene():
	$ProgressBar.value = 100*oxygene/max_oxygene

func move():
	var choice = mainscene.choices_intersection(cell)
	if choice.size() == 1 :
		update_cell(cell + choice[0])
	else :
		var new_direction = -direction
		while (new_direction == -direction):
			var index = randi() % choice.size()
			new_direction = choice[index]
		update_cell(cell + new_direction)
A0��f�3~�º�GST2            ����                        b   RIFFZ   WEBPVP8LM   /�0��?��"�G���*�m%�=$��x�>����B�"��$��K#\�hvF�\!��UȮ��N]�K��"��� �P��[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cixygqpk6jlyw"
path="res://.godot/imported/Astronaut.png-42c0d6916b16b162d4a2cf497896b6d4.ctex"
metadata={
"vram_texture": false
}
 %/�ռ���RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    radius    script 	   _bundled    
   Texture2D    res://Astronaut.png �C�FT�J   Script    res://Astronaut.gd ��������
   Texture2D    res://Chrono_outside.png �_ c�-
   Texture2D    res://Chrono_inside.png �3QB�'�U      local://CircleShape2D_k1f5p �         local://PackedScene_qs78f          CircleShape2D            �@         PackedScene          	         names "         Node2D    texture    script 	   Sprite2D    Body    CharacterBody2D    CollisionShape2D    shape    ProgressBar    offset_left    offset_top    offset_right    offset_bottom    scale    value 
   fill_mode    texture_under    texture_progress    radial_center_offset    TextureProgressBar    	   variants                                          A      �      B     �A
      ?   ?     �B                        
         `@      node_count             nodes     6   ��������       ����                                  ����                     ����                           ����
   	      
                                 	      
                         conn_count              conns               node_paths              editable_instances              version             RSRCC�to�"{�extends Node2D

@onready var instanceAstro = preload("res://Astronaut.tscn")
@onready var AstroCooldown = 0
var count = 0;
var cell :Vector2i
var main : Main
var manager : Node2D
var queue = []
var off = false

# Called when the node enters the scene tree for the first time.
func init(newm : Main, newmana :Node2D):
	main = newm
	cell = main.pos_to_grid(main.to_local(position))
	manager = newmana
	main.connect("startall",turn_on)
	main.connect("stopall",turn_off)
	#print(main.pos_to_grid(position))
	#print(main.choices_intersection(Vector2i(54,21)))

func turn_on():
	off = false

func turn_off():
	off = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if off :
		return
	if not(queue.is_empty()) :
		count -= delta
		if count < 0 :
			var next = queue.pop_front()
			manager.add_child(next)
			count += AstroCooldown
	else :
		count = 0
#	count += delta
#	if count > AstroCooldown :
#		count -= AstroCooldown
#		manager.add_child(new_astro)
		
func spawn():
	var new_astro = instanceAstro.instantiate()
	AstroCooldown =new_astro.cooldown *2
	new_astro.init(Vector2i(cell),main)
	queue.append(new_astro)
3RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://astronaute_spawner.gd ��������      local://PackedScene_h028q          PackedScene          	         names "         AstronauteSpawner    script    Spawner    Node2D    	   variants                       node_count             nodes     
   ��������       ����                      conn_count              conns               node_paths              editable_instances              version             RSRC�&��eq��YGST2            ����                        b   RIFFZ   WEBPVP8LM   /@ _����6��Ƹ��>E�$���G�/ ����ہ�t� �����VP�
���R(K(!|�B���Z�D��C��  <!�]O[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://dfdh72kg1wysk"
path="res://.godot/imported/Barre_oxygene.png-9591223e1cfd15bc3b188333ac7744a5.ctex"
metadata={
"vram_texture": false
}
 aRGST2              ����                            RIFF�   WEBPVP8L�   /�O���$h�d����X�l��_�'������&n�Y��L�ʣ 	����������R?�K��RK�{ �=�,}�HD���۶�����=C��+�o&~�`t����y��'�ڮO�]iM�v_f,�1-���"�������L��D�>��$Ȱ�x����:Q,m��/��c�FC/&q��e�I�o���Jx�_=s���p�5�"�����gNz���7*�ޤ��G�[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cug4v1xkk8jhb"
path="res://.godot/imported/Chrono_inside.png-7ce899315786f1b7d5b994033466c713.ctex"
metadata={
"vram_texture": false
}
 �"O��gGST2              ����                          �   RIFF�   WEBPVP8L�   /�G H���c�@�����=�XA�6L?�c� ~�1���ਸ਼II;���:�q�$ `�W�]I����O���T�`)�#"�U/w�_Eh'�����>����%��ɥM �B�JD� �{���3�b,<��?N��P�01�9�!#q�`*F~('@=�U%rM���5�&�%r�j �v�|幐�l�[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://quyydsm7t5ol"
path="res://.godot/imported/Chrono_outside.png-4fd69f4f4aba3437f2f3ff344cd19a0a.ctex"
metadata={
"vram_texture": false
}
 �1�F�extends Button


@onready var open_door = preload("res://Door_open.png")
@onready var close_door = preload("res://Door_close.png")
var cell : Vector2i
var main : Main
@export var open :bool = true 

func init(new_main : Main):
	main = new_main
	cell = main.pos_to_grid($Position.get_global_position())
	main.connect("stopall", opening)
	

func opening():
	main.open_door(self)
	open = true;
	self.icon = open_door
	
func closing():
	main.check_open_door()
	main.close_door(self)
	open = false
	self.icon = close_door

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_down():
	if open :
		closing()
	else :
		opening()
5�r
�R����RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script    
   Texture2D    res://Door_open.png ���D�E�y   Script    res://Door.gd ��������      local://PackedScene_iolka 3         PackedScene          	         names "         Door    offset_left    offset_top    offset_right    offset_bottom    icon    flat    icon_alignment    script    Button 	   Position 	   position    Node2D    _on_button_down    button_down    	   variants    	        ��     @�     �@     @A                               
     �@  @A      node_count             nodes     !   ��������	       ����                                                                      
   ����                   conn_count             conns                                       node_paths              editable_instances              version             RSRC���(GST2            ����                        $   RIFF   WEBPVP8L   /� ]��"�� ]jz�[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://vrrfdc5q5378"
path="res://.godot/imported/Door_close.png-6be3d3380bff0c508683e1de886a118c.ctex"
metadata={
"vram_texture": false
}
 �)�����GST2            ����                        :   RIFF2   WEBPVP8L%   /���$4��C�&O'���	 ��K��A  �����,Zr-[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://dxdkawir3b1gv"
path="res://.godot/imported/Door_open.png-b01d1e69efb446a65dc29d10475331e7.ctex"
metadata={
"vram_texture": false
}
 �4����GST2   �   �      ����               � �        $  RIFF  WEBPVP8L  /������!"2�H�l�m�l�H�Q/H^��޷������d��g�(9�$E�Z��ߓ���'3���ض�U�j��$�՜ʝI۶c��3� [���5v�ɶ�=�Ԯ�m���mG�����j�m�m�_�XV����r*snZ'eS�����]n�w�Z:G9�>B�m�It��R#�^�6��($Ɓm+q�h��6�5��I��'���F�"ɹ{�p����	"+d������M�q��� .^>и��6��a�q��gD�h:L��A�\D�
�\=k�(���_d2W��dV#w�o�	����I]�q5�*$8Ѡ$G9��lH]��c�LX���ZӞ3֌����r�2�2ؽL��d��l��1�.��u�5�!�]2�E��`+�H&�T�D�ި7P��&I�<�ng5�O!��͙������n�
ؚѠ:��W��J�+�����6��ɒ�HD�S�z�����8�&�kF�j7N�;YK�$R�����]�VٶHm���)�rh+���ɮ�d�Q��
����]	SU�9�B��fQm]��~Z�x.�/��2q���R���,snV{�7c,���p�I�kSg�[cNP=��b���74pf��)w<:Ŋ��7j0���{4�R_��K܅1�����<߁����Vs)�j�c8���L�Um% �*m/�*+ �<����S��ɩ��a��?��F�w��"�`���BrV�����4�1�*��F^���IKJg`��MK������!iVem�9�IN3;#cL��n/�i����q+������trʈkJI-����R��H�O�ܕ����2
���1&���v�ֳ+Q4蝁U
���m�c�����v% J!��+��v%�M�Z��ꚺ���0N��Q2�9e�qä�U��ZL��䜁�u_(���I؛j+0Ɩ�Z��}�s*�]���Kܙ����SG��+�3p�Ei�,n&���>lgC���!qյ�(_e����2ic3iڦ�U��j�q�RsUi����)w��Rt�=c,if:2ɛ�1�6I�����^^UVx*e��1�8%��DzR1�R'u]Q�	�rs��]���"���lW���a7]o�����~P���W��lZ�+��>�j^c�+a��4���jDNὗ�-��8'n�?e��hҴ�iA�QH)J�R�D�̰oX?ؿ�i�#�?����g�к�@�e�=C{���&��ށ�+ڕ��|h\��'Ч_G�F��U^u2T��ӁQ%�e|���p ���������k	V����eq3���8 � �K�w|�Ɗ����oz-V���s ����"�H%* �	z��xl�4��u�"�Hk�L��P���i��������0�H!�g�Ɲ&��|bn�������]4�"}�"���9;K���s��"c. 8�6�&��N3R"p�pI}��*G��3@�`��ok}��9?"@<�����sv� ���Ԣ��Q@,�A��P8��2��B��r��X��3�= n$�^ ������<ܽ�r"�1 �^��i��a �(��~dp-V�rB�eB8��]
�p ZA$\3U�~B�O ��;��-|��
{�V��6���o��D��D0\R��k����8��!�I�-���-<��/<JhN��W�1���H�#2:E(*�H���{��>��&!��$| �~�\#��8�> �H??�	E#��VY���t7���> 6�"�&ZJ��p�C_j���	P:�a�G0 �J��$�M���@�Q��[z��i��~q�1?�E�p�������7i���<*�,b�е���Z����N-
��>/.�g�'R�e��K�)"}��K�U�ƹ�>��#�rw߶ȑqF�l�Ο�ͧ�e�3�[䴻o�L~���EN�N�U9�������w��G����B���t��~�����qk-ί�#��Ξ����κ���Z��u����;{�ȴ<������N�~���hA+�r ���/����~o�9>3.3�s������}^^�_�����8���S@s%��]K�\�)��B�w�Uc۽��X�ǧ�;M<*)�ȝ&����~$#%�q����������Q�4ytz�S]�Y9���ޡ$-5���.���S_��?�O/���]�7�;��L��Zb�����8���Guo�[''�،E%���;����#Ɲ&f��_1�߃fw�!E�BX���v��+�p�DjG��j�4�G�Wr����� 3�7��� ������(����"=�NY!<l��	mr�՚���Jk�mpga�;��\)6�*k�'b�;	�V^ݨ�mN�f�S���ն�a���ϡq�[f|#U����^����jO/���9͑Z��������.ɫ�/���������I�D��R�8�5��+��H4�N����J��l�'�כ�������H����%"��Z�� ����`"��̃��L���>ij~Z,qWXo�}{�y�i�G���sz�Q�?�����������lZdF?�]FXm�-r�m����Ф:�З���:}|x���>e������{�0���v��Gş�������u{�^��}hR���f�"����2�:=��)�X\[���Ů=�Qg��Y&�q�6-,P3�{�vI�}��f��}�~��r�r�k�8�{���υ����O�֌ӹ�/�>�}�t	��|���Úq&���ݟW����ᓟwk�9���c̊l��Ui�̸~��f��i���_�j�S-|��w�R�<Lծd�ٞ,9�8��I�Ү�6 *3�ey�[�Ԗ�k��R���<������
g�R���~��a��
��ʾiI9u����*ۏ�ü�<mԤ���T��Amf�B���ĝq��iS��4��yqm-w�j��̝qc�3�j�˝mqm]P��4���8i�d�u�΄ݿ���X���KG.�?l�<�����!��Z�V�\8��ʡ�@����mK�l���p0/$R�����X�	Z��B�]=Vq �R�bk�U�r�[�� ���d�9-�:g I<2�Oy�k���������H�8����Z�<t��A�i��#�ӧ0"�m�:X�1X���GҖ@n�I�겦�CM��@������G"f���A$�t�oyJ{θxOi�-7�F�n"�eS����=ɞ���A��Aq�V��e����↨�����U3�c�*�*44C��V�:4�ĳ%�xr2V�_)^�a]\dZEZ�C 
�*V#��	NP��\�(�4^sh8T�H��P�_��}�r�bc[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cpn4vac2no4mv"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 wl�t����W��Mextends Node2D
class_name Main

var cell_dico = {} 
@onready var map = $TileMap 
@onready var manager = $SpacionauteManager
var doors_dico = {}

var count_door = 4
var array_door = []

var spawner_array = []

var count_death = 0

var waveNum = 1

var off = false

var waveCount = 15
var waveCooldown = 16
signal stopall()
signal startall()

func _ready():
	var temp = map.get_used_cells(0);
	for cell in temp :
		cell_dico[cell] = 1
	randomize()
	var spawners = get_tree().get_nodes_in_group("Spawner")
	for spwn in spawners :
		spwn.init(self,manager)
		spawner_array.append(spwn)
	var doors = get_tree().get_nodes_in_group("Door")
	for do in doors :
		do.init(self)
		doors_dico[do.cell] = do


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if off :
		return
	waveCount += delta
	if  waveCount > waveCooldown :
		waveCount -= waveCooldown
		for i in range(waveNum) :
			var index = randi()% spawner_array.size()
			spawner_array[index].spawn()
		waveNum += 1
	#print(pos_to_grid(get_viewport().get_mouse_position()))


func check_open_door() :
	if count_door == 0 :
		array_door[0].opening()


func open_door(door):
	array_door.erase(door)
	count_door += 1
	
func close_door(door):
	count_door -= 1
	array_door.append(door)
	
func pos_to_grid(glob_pos: Vector2):
	return map.local_to_map(map.to_local(glob_pos))
	
func grid_to_pos(grid_pos : Vector2i):
	return map.to_global( map.map_to_local(grid_pos))

func choices_intersection ( grid_pos:Vector2i ) :
	var retval = []
	var direction = [Vector2i.UP, Vector2i.DOWN, Vector2i.LEFT, Vector2i.RIGHT]
	for dir in direction :
		if cell_dico.has(grid_pos + dir):
			if not(doors_dico.has(grid_pos + dir)) || doors_dico[grid_pos + dir].open :
				retval.append(dir)
	
	return retval

func on_death():
	count_death += 1
	$Label.text = str(count_death)

func _on_area_2d_body_entered(body):
	$GameOver.visible = true
	emit_signal("stopall")
	array_door = []
	count_door = 4
	off = true


func _on_button_pressed():
	emit_signal("startall")
	$GameOver.visible = false
	waveNum = 1
	count_death = 0
	waveCount = 15
	$Label.text = str(count_death)
	off = false
���hRSRC                    PackedScene            ��������                                            g      resource_local_to_scene    resource_name    texture    margins    separation    texture_region_size    use_texture_padding    0:0/0    0:0/0/terrain_set %   0:0/0/terrains_peering_bit/left_side $   0:0/0/terrains_peering_bit/top_side    0:0/0/script    1:0/0    1:0/0/terrain_set $   1:0/0/terrains_peering_bit/top_side    1:0/0/script    2:0/0    2:0/0/terrain_set &   2:0/0/terrains_peering_bit/right_side $   2:0/0/terrains_peering_bit/top_side    2:0/0/script    3:0/0    3:0/0/terrain_set '   3:0/0/terrains_peering_bit/bottom_side $   3:0/0/terrains_peering_bit/top_side    3:0/0/script    0:1/0    0:1/0/terrain_set %   0:1/0/terrains_peering_bit/left_side    0:1/0/script    1:1/0    1:1/0/terrain_set    1:1/0/script    2:1/0    2:1/0/terrain_set &   2:1/0/terrains_peering_bit/right_side    2:1/0/script    3:1/0    3:1/0/terrain_set &   3:1/0/terrains_peering_bit/right_side %   3:1/0/terrains_peering_bit/left_side    3:1/0/script    0:2/0    0:2/0/terrain_set '   0:2/0/terrains_peering_bit/bottom_side %   0:2/0/terrains_peering_bit/left_side    0:2/0/script    1:2/0    1:2/0/terrain_set '   1:2/0/terrains_peering_bit/bottom_side    1:2/0/script    2:2/0    2:2/0/terrain_set &   2:2/0/terrains_peering_bit/right_side '   2:2/0/terrains_peering_bit/bottom_side    2:2/0/script    3:2/0    3:2/0/terrain_set &   3:2/0/terrains_peering_bit/right_side %   3:2/0/terrains_peering_bit/left_side $   3:2/0/terrains_peering_bit/top_side    3:2/0/script    0:3/0    0:3/0/terrain_set &   0:3/0/terrains_peering_bit/right_side '   0:3/0/terrains_peering_bit/bottom_side %   0:3/0/terrains_peering_bit/left_side    0:3/0/script    1:3/0    1:3/0/terrain_set &   1:3/0/terrains_peering_bit/right_side '   1:3/0/terrains_peering_bit/bottom_side $   1:3/0/terrains_peering_bit/top_side    1:3/0/script    2:3/0    2:3/0/terrain_set '   2:3/0/terrains_peering_bit/bottom_side %   2:3/0/terrains_peering_bit/left_side $   2:3/0/terrains_peering_bit/top_side    2:3/0/script    3:3/0    3:3/0/terrain_set &   3:3/0/terrains_peering_bit/right_side '   3:3/0/terrains_peering_bit/bottom_side %   3:3/0/terrains_peering_bit/left_side $   3:3/0/terrains_peering_bit/top_side    3:3/0/script    script    tile_shape    tile_layout    tile_offset_axis 
   tile_size    uv_clipping    terrain_set_0/mode    terrain_set_0/terrain_0/name    terrain_set_0/terrain_0/color 
   sources/0    tile_proxies/source_level    tile_proxies/coords_level    tile_proxies/alternative_level    custom_solver_bias    size 	   _bundled       Script    res://main.gd ��������
   Texture2D    res://Tile.png q�&ṢxQ
   Texture2D    res://Outlet.png Bt���4   PackedScene    res://astronaute_spawner.tscn u��=�G�E   PackedScene    res://door.tscn K	p۝�   !   local://TileSetAtlasSource_xmc7p 	         local://TileSet_ste35 �         local://RectangleShape2D_vxkjg          local://PackedScene_fcal3 J         TileSetAtlasSource R                                   	          
                                                                                                                                                                                                               !          "          #          $      %          &          '          (          )      *          +          ,          -          .      /          0          1          2      3          4          5          6          7      8          9          :          ;          <          =      >          ?          @          A          B          C      D          E          F          G          H          I      J          K          L          M          N          O      P          Q          R          S          T          U          V      W         TileSet    ]         ^         Neon _      ���>��j?��f?  �?`             W         RectangleShape2D    e   
     �B  xBW         PackedScene    f      	         names "   S      Main    script    Node2D 
   ColorRect    custom_minimum_size    offset_right    offset_bottom    color    TileMap 	   position 	   tile_set    format    layer_0/tile_data 	   Sprite2D    texture    Area2D    CollisionShape2D    shape    SpacionauteManager    SpawnerManager    SpacionauteSpawner    SpacionauteSpawner2    SpacionauteSpawner3    SpacionauteSpawner4    SpacionauteSpawner5    SpacionauteSpawner6    SpacionauteSpawner7    SpacionauteSpawner8    SpacionauteSpawner9    SpacionauteSpawner10    SpacionauteSpawner11    SpacionauteSpawner12    SpacionauteSpawner13    DoorManager    Door    offset_left    offset_top    Door16    Door17    Door23    Door18    Door19    Door20    Door21    Door22    Door3    Door7    Door8    Door2 	   rotation    Door4    Door9    Door10    Door11    Door24    Door12    Door13    Door14    Door15    Door5    Door6 	   GameOver    visible    Label 	   modulate    layout_mode    anchors_preset    anchor_left    anchor_right    grow_horizontal    scale    text    Label2    anchor_top    anchor_bottom    grow_vertical    horizontal_alignment    vertical_alignment    Button    _on_area_2d_body_entered    body_entered    _on_button_pressed    pressed    	   variants    �             
    ��D �"D    ��D    �"D                 �?
     �?                       3  F         E        D        C        B        A        @        ?        >        =         <        ;        :        9        8        7        6        5        4        3        2        1        0        /        .        -        ,        +        *        )        (         '        &        %        $        #        "        <        ;        :        9        8        7        6        5        4        3        2        1         0        /        .        -        ,        +        *        )        (        '        &        %         $        #        "        % $        % #        % "        % !        %         %         %         %         %         5        5         5         5        5         5         5         5         5         5         '        '         '         '         '        '         '         ' 	        ' 
        '         '         '         '                          !                                                                                                                                                                                                                         	        
                                                                                                                                                         %         $         #        "         !                                                                                  #         #        #        #        #        #        #        #        #        #        #        #        #        #        #                                  !         "                                                                         	        
                                                                                                                                                                 $         #        "        !                                                                                                                                                                                          
         	                                                                $          $         $         $ 
        $ 	       $         $         $         $         $         $         $         !        "        #                  ?         >        =        (        )        *        +        ,        -        .        /        0        1        2        3        4        (         (         (         (                                                                                                                                               $         #         "         !                                                                1 $        1 #        1 "        1 !        1         1         1         1         1         %         $        #        "        !         	        	        	        	         	        	        	        	        	        	        	         	       ! 	       " 	       # 	        
                                            
         
         
 
        
 	       
         
         
         
         
         
         
                                                                                                                                 	 	        	        	        	        	        	        	        	        	                                                                                                                              
        	                                                                             !         "                                                                      )         *         +         ,         -         .         /         0         ) '        ) &        ) %        ) $        ) #        ) "        ) !        ? %        ? $        ? #        ? "        ? !        ?          ?         ?         ?         ?         C         B        A        @        ?        >        =        <         ;        :        9        8        7        6        5        4        3        2        1        0        /        .        -        ,        +        *        )        (        <         <        < 
        < 	        <         <         /        0        1         2        3        4        5        6        7        8        9        :        ;        1         1         1         /        /         /         /         /         =         =        =         =         =         =         =         =         =         =         7        8        9        :        ;        <        7         7                  !        !        !                                                     	                                                 !        '         '         '         '         '         '         '                                                        
    @ D  �C                           
    �>D  �A
    ��D  �B
     �D  yC
    �~D  D
    �FD �D
    @&D @D
    @D  D
    ��C  D
     hC �D
     �B  �C
     �A  xC
     �A  C
     ,B  �A             ��C     �C    ��C     �C     �C     lC     �C     �C    �4D     7D    �D     �C    @D     �C    �0D    @3D    @xD    �zD    �mD     �C     pD     �C     �C     D     �C     D     �B     C     D    �D    ��C     C    ��C     $C    ��C     @A    ��C     B    ��C    ��C   ��?    ��C      D    ��C     D    ��C     �C    ��C     �C    @AD     �B    �CD     �B    @!D     �B    �#D     �B     C     *C     5C     �B     ?C     	C    ��C    @%D    ��C    �'D    ��C    �ID    ��C     LD    ��C    @D    ��C    �D    ��C    @YD     �C    �[D     �C          ���<  �?      �?           �?    ��     A     ��     B       
     @@  @@      Humains tués             ?     ��     M�     b�     3�
     �@  �@   
   GAME OVER     ��C     �C    ��C    ��C
     �@  �@      REPLAY     �oD     0A    �yD     B      0       node_count    3         nodes     �  ��������       ����                            ����                                             ����   	      
                                    ����   	   	      
                    ����                     ����                           ����                      ����               ���         	                 ���         	                 ���         	                 ���         	                 ���         	                 ���         	                 ���         	                 ���         	                 ���         	                 ���         	                 ���         	                 ���         	                 ���          	                     !   ����               ���"         #      $                             ���%         #      $          !      "              ���&         #   #   $          $      "              ���'         #   %   $   &      '      (              ���(         #   )   $   &      *      (              ���)         #   +   $   &      ,      (              ���*         #   -   $   .      /      0              ���+         #   1   $   2      3      4              ���,         #   5   $         6                    ���-         #   7   $         8                    ���.         #   9   $   :      ;      <              ���/         #   =   $   >      ?      @              ���0         #   A   $   0      B      &   1   C              ���2         #   D   $   E      F      G   1   C              ���3         #   H   $   I      J      K   1   C              ���4         #   L   $   M      N      O   1   C              ���5         #   P   $   Q      R      S   1   C              ���6         #   P   $   T      R      U   1   C              ���7         #   V   $   W      X      Y   1   C              ���8         #   =   $   Z      ?         1   C              ���9         #   [   $   \      ]      ^   1   C              ���:         #   _   $   `      a      b   1   C              ���;         #   c   $   d      e      f   1   C              ���<         #   g   $   h      i      j   1   C                  =   ����   >   k                               .       ?   ?   ����   @   l   A   m   B   m   C   n   D   n   #   o   $   p      q      r   E   s   F   t   G   u       .       ?   H   ����   @   l   A   m   B   v   C   w   I   w   D   w   J   w   #   x   $   y      z      {   E      K      F   |   G   }   L   m   M   m       .       N   N   ����   @   l   A   s   #   ~   $         �      �   F   �   G   �               ?   ?   ����   @   l   #   �   $   �      �      �   F   t   G   �             conn_count             conns               P   O              1       R   Q                    node_paths              editable_instances              version       W      RSRCr~�l�MGST2   @   @      ����               @ @        
  RIFF  WEBPVP8L�   /?�G0�4�d�6m�_�� �b�v�6�x�EkU�&T�} �.�"�?�tR]�s�c���$뚀 �$hp���	�@@��2��(��3�#��{�P�v\g��Gg~U���L��$#a	0�~GӋ1z����p��\m�׊+���)]R�37�g�o\�.W�m�\JO��m�e���`�|/ii�		p��<3�$+Ƙ�\�/\�4 7�蚀$�1z�ѻr4ͅ�]��w�����6��h��^V�[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://buf6k834wclvp"
path="res://.godot/imported/Outlet.png-4b38ede37460b7184cefed66c4aef419.ctex"
metadata={
"vram_texture": false
}
 ,p��fJ��^0�GST2   @   @      ����               @ @          RIFF  WEBPVP8L�   /?�p䶍$��?��R���J�$S�l}�[���w�a䶍#괽��;�$����}�܉i������A����w���x7�L�R�u�{H7��/�O�ӫ����N���M�4k�l�i����ծ�m��O�T�}�J�SZ�J���5����Ť���Ҵ�f�5t�Cf$�A����@q�ft&P�i���?e^u�>!���~R?�p����&��[,2���E�㌦�fd��_'��̫��?a��L�YN3���u 6�Tӈm[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cpv1j4nfd8ren"
path="res://.godot/imported/Tile.png-234d274035d91a842071fd1b6df51f5f.ctex"
metadata={
"vram_texture": false
}
 �;>P#�[�\j����[remap]

path="res://.godot/exported/133200997/export-1f99a6b2c6bc083cf54233ed7519089b-Astronaut.scn"
�̃6���g�:[remap]

path="res://.godot/exported/133200997/export-fe59e16d86e347c02ec62b7a4e9f8615-astronaute_spawner.scn"
�[remap]

path="res://.godot/exported/133200997/export-8983deb26aa580c1e8cfdf2626a973f8-door.scn"
�ױ(��?�FN;�=[remap]

path="res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn"
݂��������T;�list=Array[Dictionary]([{
"base": &"Node2D",
"class": &"Main",
"icon": "",
"language": &"GDScript",
"path": "res://main.gd"
}])
<svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><g transform="translate(32 32)"><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99z" fill="#363d52"/><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99zm0 4h96c6.64 0 12 5.35 12 11.99v95.98c0 6.64-5.35 11.99-12 11.99h-96c-6.64 0-12-5.35-12-11.99v-95.98c0-6.64 5.36-11.99 12-11.99z" fill-opacity=".4"/></g><g stroke-width="9.92746" transform="matrix(.10073078 0 0 .10073078 12.425923 2.256365)"><path d="m0 0s-.325 1.994-.515 1.976l-36.182-3.491c-2.879-.278-5.115-2.574-5.317-5.459l-.994-14.247-27.992-1.997-1.904 12.912c-.424 2.872-2.932 5.037-5.835 5.037h-38.188c-2.902 0-5.41-2.165-5.834-5.037l-1.905-12.912-27.992 1.997-.994 14.247c-.202 2.886-2.438 5.182-5.317 5.46l-36.2 3.49c-.187.018-.324-1.978-.511-1.978l-.049-7.83 30.658-4.944 1.004-14.374c.203-2.91 2.551-5.263 5.463-5.472l38.551-2.75c.146-.01.29-.016.434-.016 2.897 0 5.401 2.166 5.825 5.038l1.959 13.286h28.005l1.959-13.286c.423-2.871 2.93-5.037 5.831-5.037.142 0 .284.005.423.015l38.556 2.75c2.911.209 5.26 2.562 5.463 5.472l1.003 14.374 30.645 4.966z" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 919.24059 771.67186)"/><path d="m0 0v-47.514-6.035-5.492c.108-.001.216-.005.323-.015l36.196-3.49c1.896-.183 3.382-1.709 3.514-3.609l1.116-15.978 31.574-2.253 2.175 14.747c.282 1.912 1.922 3.329 3.856 3.329h38.188c1.933 0 3.573-1.417 3.855-3.329l2.175-14.747 31.575 2.253 1.115 15.978c.133 1.9 1.618 3.425 3.514 3.609l36.182 3.49c.107.01.214.014.322.015v4.711l.015.005v54.325c5.09692 6.4164715 9.92323 13.494208 13.621 19.449-5.651 9.62-12.575 18.217-19.976 26.182-6.864-3.455-13.531-7.369-19.828-11.534-3.151 3.132-6.7 5.694-10.186 8.372-3.425 2.751-7.285 4.768-10.946 7.118 1.09 8.117 1.629 16.108 1.846 24.448-9.446 4.754-19.519 7.906-29.708 10.17-4.068-6.837-7.788-14.241-11.028-21.479-3.842.642-7.702.88-11.567.926v.006c-.027 0-.052-.006-.075-.006-.024 0-.049.006-.073.006v-.006c-3.872-.046-7.729-.284-11.572-.926-3.238 7.238-6.956 14.642-11.03 21.479-10.184-2.264-20.258-5.416-29.703-10.17.216-8.34.755-16.331 1.848-24.448-3.668-2.35-7.523-4.367-10.949-7.118-3.481-2.678-7.036-5.24-10.188-8.372-6.297 4.165-12.962 8.079-19.828 11.534-7.401-7.965-14.321-16.562-19.974-26.182 4.4426579-6.973692 9.2079702-13.9828876 13.621-19.449z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 104.69892 525.90697)"/><path d="m0 0-1.121-16.063c-.135-1.936-1.675-3.477-3.611-3.616l-38.555-2.751c-.094-.007-.188-.01-.281-.01-1.916 0-3.569 1.406-3.852 3.33l-2.211 14.994h-31.459l-2.211-14.994c-.297-2.018-2.101-3.469-4.133-3.32l-38.555 2.751c-1.936.139-3.476 1.68-3.611 3.616l-1.121 16.063-32.547 3.138c.015-3.498.06-7.33.06-8.093 0-34.374 43.605-50.896 97.781-51.086h.066.067c54.176.19 97.766 16.712 97.766 51.086 0 .777.047 4.593.063 8.093z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 784.07144 817.24284)"/><path d="m0 0c0-12.052-9.765-21.815-21.813-21.815-12.042 0-21.81 9.763-21.81 21.815 0 12.044 9.768 21.802 21.81 21.802 12.048 0 21.813-9.758 21.813-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 389.21484 625.67104)"/><path d="m0 0c0-7.994-6.479-14.473-14.479-14.473-7.996 0-14.479 6.479-14.479 14.473s6.483 14.479 14.479 14.479c8 0 14.479-6.485 14.479-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 367.36686 631.05679)"/><path d="m0 0c-3.878 0-7.021 2.858-7.021 6.381v20.081c0 3.52 3.143 6.381 7.021 6.381s7.028-2.861 7.028-6.381v-20.081c0-3.523-3.15-6.381-7.028-6.381" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 511.99336 724.73954)"/><path d="m0 0c0-12.052 9.765-21.815 21.815-21.815 12.041 0 21.808 9.763 21.808 21.815 0 12.044-9.767 21.802-21.808 21.802-12.05 0-21.815-9.758-21.815-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 634.78706 625.67104)"/><path d="m0 0c0-7.994 6.477-14.473 14.471-14.473 8.002 0 14.479 6.479 14.479 14.473s-6.477 14.479-14.479 14.479c-7.994 0-14.471-6.485-14.471-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 656.64056 631.05679)"/></g></svg>
��   �C�FT�J   res://Astronaut.png���st(   res://Astronaut.tscnu��=�G�E   res://astronaute_spawner.tscn��:WCUQh   res://Barre_oxygene.png�3QB�'�U   res://Chrono_inside.png�_ c�-   res://Chrono_outside.pngK	p۝�   res://door.tscn��;)=��   res://Door_close.png���D�E�y   res://Door_open.png��/�:�>Q   res://icon.svg��g�Htlg   res://main.tscnBt���4   res://Outlet.pngq�&ṢxQ   res://Tile.png��0"�7   res://HTML/index.icon.png~�1w��c%   res://HTML/index.apple-touch-icon.png��f��   res://HTML/index.pngŹ/� 򝩺+Η�lsECFG      application/config/name         Jam    application/run/main_scene         res://main.tscn    application/config/features$   "         4.1    Forward Plus       application/config/icon         res://icon.svg  9   rendering/textures/canvas_textures/default_texture_filter          `�{��1�^��