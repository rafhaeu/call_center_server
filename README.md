# README

This is a rails application that stores recieved and outgoing calls from call 
centers.  As it is, the fields are: 
* called_at: time of the call
* phone: external phone number
* internal: internal number
* call_type: incoming, outgoing
* client: checks in client_phones and if there is a phone registered, it stores
  the client_id

## Tested Call Centers

* Siemens HiPath 3700
