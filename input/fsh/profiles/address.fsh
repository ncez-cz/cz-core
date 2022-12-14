//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:    CZ_Address
Parent:     Address
Id:         cz-address
Title:      "Address (CZ)"
Description: "Czech national profile on address, to provide the possibility in the 'line' element to provide a seperate streetname, housenumber and postal box. It is always RECOMMENDED to give these elements seperately."
//-------------------------------------------------------------------------------------------

* ^version = "1.0.0"
* . ^comment = "Note: address is intended to describe postal addresses for administrative purposes, not to describe absolute geographical coordinates.  Postal addresses are often used as proxies for physical locations (also see the [Location](location.html#) resource)."
* line ^definition = "This component contains the house number, apartment number, street name, street direction, P.O. Box number, delivery hints, and similar address information. It is always RECOMMENDED to give these elements seperately using the defined extensions."
* line.extension ^slicing.discriminator.type = #value
* line.extension ^slicing.discriminator.path = "url"
* line.extension ^slicing.rules = #open
* line.extension ^definition = "RECOMMENDED to use these extensions to define address elements."
* line.extension contains
    $iso21090-ADXP-streetName named Streetname 0..* and
    $iso21090-ADXP-houseNumber named Housenumber 0..* and
    $iso21090-ADXP-postBox named Postbox 0..*
* line.extension[Streetname].value[x] only string
* line.extension[Housenumber].value[x] only string
* line.extension[Postbox].value[x] only string
* country ^definition = "Country, the FHIR specification defines its country field as a string and suggests using a ISO 3166 2 or 3 letter codes. Use of 2-letter code to express country is RECOMMENDED"