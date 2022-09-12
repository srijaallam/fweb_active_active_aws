config system ha
  set mode active-active-high-volume
  set group-id 1
  set override enable
  set priority ${fwb_ha_priority}
  set group-name FWBAAGroup
  set tunnel-local ${fwb_private_ip}
  set tunnel-peer ${fwb_ha_peer_ip}
  set monitor port2
end