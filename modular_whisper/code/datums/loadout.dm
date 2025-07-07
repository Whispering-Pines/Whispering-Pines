GLOBAL_LIST_EMPTY(loadout_items)

/datum/loadout_item
	var/name = "Parent loadout datum"
	var/desc
	var/path
	var/donoritem			//autoset on new if null
	var/list/ckeywhitelist

/datum/loadout_item/New()
	if(isnull(donoritem))
		if(ckeywhitelist)
			donoritem = TRUE

/datum/loadout_item/proc/donator_ckey_check(key)
	if(ckeywhitelist && ckeywhitelist.Find(key))
		return TRUE
	return

//Miscellaneous

/datum/loadout_item/card_deck
	name = "Card Deck"
	path = /obj/item/toy/cards/deck

//HATS
/datum/loadout_item/shalal
	name = "Keffiyeh"
	path = /obj/item/clothing/neck/keffiyeh

/datum/loadout_item/strawhat
	name = "Straw Hat"
	path = /obj/item/clothing/head/strawhat

/datum/loadout_item/witchhat
	name = "Witch Hat"
	path = /obj/item/clothing/head/wizhat/witch

/datum/loadout_item/bardhat
	name = "Bard Hat"
	path = /obj/item/clothing/head/bardhat

/datum/loadout_item/fancyhat
	name = "Fancy Hat"
	path = /obj/item/clothing/head/fancyhat

/datum/loadout_item/headband
	name = "Headband"
	path = /obj/item/clothing/head/headband

/datum/loadout_item/buckled_hat
	name = "Buckled Hat"
	path = /obj/item/clothing/head/helmet/leather/inquisitor

/datum/loadout_item/hood
	name = "Hood"
	path = /obj/item/clothing/head/roguehood

/datum/loadout_item/nunveil
	name = "Nun Veil"
	path = /obj/item/clothing/head/nun

/datum/loadout_item/saigaskull
	name = "Saiga Skull"
	path = /obj/item/clothing/head/helmet/leather/saiga

/datum/loadout_item/volfhelm
	name = "Volf Helm"
	path = /obj/item/clothing/head/helmet/leather/volfhelm

//CLOAKS
/datum/loadout_item/tabard
	name = "Tabard"
	path = /obj/item/clothing/cloak/tabard

/datum/loadout_item/surcoat
	name = "Surcoat"
	path = /obj/item/clothing/cloak/stabard

/datum/loadout_item/jupon
	name = "Jupon"
	path = /obj/item/clothing/cloak/stabard/surcoat

/datum/loadout_item/cape
	name = "Cape"
	path = /obj/item/clothing/cloak/cape

/datum/loadout_item/halfcloak
	name = "Halfcloak"
	path = /obj/item/clothing/cloak/half

/datum/loadout_item/raincloak
	name = "Rain Cloak"
	path = /obj/item/clothing/cloak/raincloak

/datum/loadout_item/furcloak
	name = "Fur Cloak"
	path = /obj/item/clothing/cloak/raincloak/furcloak

/datum/loadout_item/volfmantle
	name = "Volf Mantle"
	path = /obj/item/clothing/cloak/volfmantle

//SHOES
/datum/loadout_item/darkboots
	name = "Dark Boots"
	path = /obj/item/clothing/shoes/boots

/datum/loadout_item/babouche
	name = "Babouche"
	path = /obj/item/clothing/shoes/shalal

/datum/loadout_item/nobleboots
	name = "Noble Boots"
	path = /obj/item/clothing/shoes/nobleboot

/datum/loadout_item/sandals
	name = "Sandals"
	path = /obj/item/clothing/shoes/sandals

/datum/loadout_item/shortboots
	name = "Short Boots"
	path = /obj/item/clothing/shoes/shortboots

/datum/loadout_item/gladsandals
	name = "Gladiatorial Sandals"
	path = /obj/item/clothing/shoes/gladiator

/datum/loadout_item/ridingboots
	name = "Riding Boots"
	path = /obj/item/clothing/shoes/ridingboots

/datum/loadout_item/ankletscloth
	name = "Cloth Anklets"
	path = /obj/item/clothing/shoes/boots/clothlinedanklets

/datum/loadout_item/ankletsfur
	name = "Fur Anklets"
	path = /obj/item/clothing/shoes/boots/furlinedanklets

/datum/loadout_item/exoticanklets
	name = "Exotic Anklets"
	path = /obj/item/clothing/shoes/anklets

//SHIRTS

/datum/loadout_item/robe
	name = "Robe"
	path = /obj/item/clothing/shirt/robe

/datum/loadout_item/formalsilks
	name = "Formal Silks"
	path = /obj/item/clothing/shirt/undershirt/puritan

/datum/loadout_item/longshirt
	name = "Shirt"
	path = /obj/item/clothing/shirt/undershirt/black

/datum/loadout_item/shortshirt
	name = "Short-sleeved Shirt"
	path = /obj/item/clothing/shirt/shortshirt

/datum/loadout_item/sailorshirt
	name = "Striped Shirt"
	path = /obj/item/clothing/shirt/undershirt/sailor

/datum/loadout_item/sailorjacket
	name = "Leather Jacket"
	path = /obj/item/clothing/armor/leather/jacket

/datum/loadout_item/priestrobe
	name = "Undervestments"
	path = /obj/item/clothing/shirt/undershirt/priest

/datum/loadout_item/exoticsilkbra
	name = "Exotic Silk Bra"
	path = /obj/item/clothing/shirt/exoticsilkbra

/datum/loadout_item/bottomtunic
	name = "Low-cut Tunic"
	path = /obj/item/clothing/shirt/undershirt/lowcut

/datum/loadout_item/tunic
	name = "Tunic"
	path = /obj/item/clothing/shirt/tunic

/datum/loadout_item/dress
	name = "Dress"
	path = /obj/item/clothing/shirt/dress/gen

/datum/loadout_item/bardress
	name = "Bar Dress"
	path = /obj/item/clothing/shirt/dress

/datum/loadout_item/chemise
	name = "Chemise"
	path = /obj/item/clothing/shirt/dress/silkdress

/datum/loadout_item/sexydress
	name = "Sexy Dress"
	path = /obj/item/clothing/shirt/dress/gen/sexy

/datum/loadout_item/straplessdress
	name = "Strapless Dress"
	path = /obj/item/clothing/shirt/dress/gen/strapless

/datum/loadout_item/straplessdress/alt
	name = "Strapless Dress, alt"
	path = /obj/item/clothing/shirt/dress/gen/strapless/alt

/datum/loadout_item/gown
	name = "Spring Gown"
	path = /obj/item/clothing/shirt/dress/gown

/datum/loadout_item/gown/summer
	name = "Summer Gown"
	path = /obj/item/clothing/shirt/dress/gown/summergown

/datum/loadout_item/gown/fall
	name = "Fall Gown"
	path = /obj/item/clothing/shirt/dress/gown/fallgown

/datum/loadout_item/gown/winter
	name = "Winter Gown"
	path = /obj/item/clothing/shirt/dress/gown/wintergown

/datum/loadout_item/gown/silkydress
	name = "Silky Dress"
	path = /obj/item/clothing/shirt/dress/silkydress

/datum/loadout_item/leathervest
	name = "Leather Vest"
	path = /obj/item/clothing/armor/leather/vest

/datum/loadout_item/nun_habit
	name = "Nun Habit"
	path = /obj/item/clothing/shirt/robe/nun

//PANTS
/datum/loadout_item/tights
	name = "Cloth Tights"
	path = /obj/item/clothing/pants/tights/black

/datum/loadout_item/leathertights
	name = "Leather Tights"
	path = /obj/item/clothing/pants/trou/leathertights

/datum/loadout_item/trou
	name = "Work Trousers"
	path = /obj/item/clothing/pants/trou

/datum/loadout_item/leathertrou
	name = "Leather Trousers"
	path = /obj/item/clothing/pants/trou/leather

/datum/loadout_item/sailorpants
	name = "Seafaring Pants"
	path = /obj/item/clothing/pants/tights/sailor

/datum/loadout_item/skirt
	name = "Skirt"
	path = /obj/item/clothing/pants/skirt

//ACCESSORIES
/datum/loadout_item/stockings
	name = "Stockings"
	path = /obj/item/clothing/pants/tights/stockings

/datum/loadout_item/silkstockings
	name = "Silk Stockings"
	path = /obj/item/clothing/pants/tights/stockings/silk

/datum/loadout_item/fishnet
	name = "Fishnet Stockings"
	path = /obj/item/clothing/pants/tights/stockings/fishnet

/datum/loadout_item/wrappings
	name = "Handwraps"
	path = /obj/item/clothing/wrists/wrappings

/datum/loadout_item/loincloth
	name = "Loincloth"
	path = /obj/item/clothing/pants/loincloth

/datum/loadout_item/spectacles
	name = "Spectacles"
	path = /obj/item/clothing/face/spectacles

/datum/loadout_item/fingerless
	name = "Fingerless Gloves"
	path = /obj/item/clothing/gloves/fingerless

/datum/loadout_item/exoticsilkbelt
	name = "Exotic Silk Belt"
	path = /obj/item/storage/belt/leather/exoticsilkbelt

/datum/loadout_item/ragmask
	name = "Rag Mask"
	path = /obj/item/clothing/face/shepherd/rag

/datum/loadout_item/halfmask
	name = "Halfmask"
	path = /obj/item/clothing/face/shepherd

/datum/loadout_item/dendormask
	name = "Briar Mask"
	path = /obj/item/clothing/face/druid

/datum/loadout_item/exoticsilkmask
	name = "Exotic Silk Mask"
	path = /obj/item/clothing/face/exoticsilkmask

/datum/loadout_item/pipe
	name = "Pipe"
	path = /obj/item/clothing/face/cigarette/pipe

/datum/loadout_item/pipewestman
	name = "Westman Pipe"
	path = /obj/item/clothing/face/cigarette/pipe/westman

/datum/loadout_item/feather
	name = "Feather"
	path = /obj/item/natural/feather

/datum/loadout_item/collar
	name = "Leather Collar"
	path = /obj/item/clothing/neck/leathercollar

/datum/loadout_item/catbell_collar
	name = "Catbell Collar"
	path = /obj/item/clothing/neck/catbellcollar

/datum/loadout_item/cowbell_collar
	name = "Cowbell Collar"
	path = /obj/item/clothing/neck/cowbellcollar

/datum/loadout_item/cloth_blindfold
	name = "Cloth Blindfold"
	path = /obj/item/clothing/face/blindfold

/datum/loadout_item/psycross
	name = "Psydonian Cross"
	path = /obj/item/clothing/neck/psycross

/datum/loadout_item/psycross/silver/astrata
	name = "Amulet of Solaria"
	path = /obj/item/clothing/neck/psycross/silver/astrata

/datum/loadout_item/psycross/silver/noc
	name = "Amulet of Lunaria"
	path = /obj/item/clothing/neck/psycross/noc

/*
/datum/loadout_item/psycross/silver/abyssor
	name = "Amulet of Abyssor"
	path = /obj/item/clothing/neck/psycross/silver/abyssor
*/

/datum/loadout_item/psycross/silver/dendor
	name = "Amulet of Blissrose"
	path = /obj/item/clothing/neck/psycross/silver/dendor

/datum/loadout_item/psycross/silver/necra
	name = "Amulet of Last Death"
	path = /obj/item/clothing/neck/psycross/silver/necra
/*
/datum/loadout_item/psycross/silver/pestra
	name = "Amulet of Pestra"
	path = /obj/item/clothing/neck/psycross/silver/pestra

/datum/loadout_item/psycross/silver/ravox
	name = "Amulet of Ravox"
	path = /obj/item/clothing/neck/psycross/silver/ravox

/datum/loadout_item/psycross/silver/malum
	name = "Amulet of Malum"
	path = /obj/item/clothing/neck/psycross/silver/malum
*/
/datum/loadout_item/psycross/silver/eora
	name = "Amulet of Moonbeam"
	path = /obj/item/clothing/neck/psycross/silver/eora

/datum/loadout_item/chaperon
	name = "Chaperon (Normal)"
	path = /obj/item/clothing/head/chaperon

/datum/loadout_item/chaperon/alt
	name = "Chaperon (Alt)"
	path = /obj/item/clothing/head/chaperon/greyscale

/datum/loadout_item/chaperon/burgher
	name = "Silk Chaperon"
	path = /obj/item/clothing/head/chaperon/greyscale/silk

/datum/loadout_item/feldcollar
	name = "Feldcollar"
	path = /obj/item/clothing/neck/feldcollar

/datum/loadout_item/surcollar
	name = "Surgeon's Collar"
	path = /obj/item/clothing/neck/surcollar

/datum/loadout_item/rope_leash
	name = "Rope Leash"
	path = /obj/item/leash

/datum/loadout_item/leather_leash
	name = "Leather Leash"
	path = /obj/item/leash/leather

/datum/loadout_item/chain_leash
	name = "Chain Leash"
	path = /obj/item/leash/chain
