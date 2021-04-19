global type uint = integer
global type uint16 = integer
global type double = number
global type PlayerSpecification = uint | string -- | LuaPlayer


-- local record LuaCustomTable<K, V>
--   object_name: string
--   valid: boolean
-- end

global record LuaEntity
  valid: boolean
  request_slot_count: uint
end

global record PersonalLogisticParameters
  name: string
  min: uint
  max: uint
end

global record LuaPlayer
  clear_personal_logistic_slot: function(slot: uint)
  get_personal_logistic_slot: function(slot: uint): PersonalLogisticParameters
  set_personal_logistic_slot: function(slot: uint, PersonalLogisticParameters): boolean

  mod_settings: {string: ModSetting}

  character: LuaEntity
end

global type ItemStackSpecification = any

global record LuaGroup
end

global record LuaItemPrototype
  group: LuaGroup
end

global record LuaItemStack
  name: string
  prototype: LuaItemPrototype
end

global record LuaInventory
  insert: function(items: ItemStackSpecification): uint
  sort_and_merge: function()
  destroy: function()
  count_empty_stacks: function(): uint

  {LuaItemStack}
end

global record LuaGameScript
  get_player: function(player: uint | string): LuaPlayer
  create_inventory: function(size: uint16): LuaInventory
end

global record LuaBootstrap
  on_event: function(event: any, f: (function(event: any)), filters: any): nil
end

global record ModSetting
  value: uint | double | boolean | string
end

global record LuaSettings
  object_name: string

  get_player_settings: function(index: uint | string): {string: ModSetting}
end

global record OnEntityLogisticSlotChangedEvent 
  player_index: uint
  entity: LuaEntity
  slot_index: uint
end


global game: LuaGameScript;
global script: LuaBootstrap;
global settings: LuaSettings;


global record data

  extend: function(self: data, ...: any): any...

end

global record defines
  events: {any: any}
end