import httpclient
import strformat
import json
import wilayahindo/utils

var c = newHttpClient()

proc getListProvinsi*(): seq[Provinsi] = 
  var res = newApiRequest(c, HttpGet, "/provinces.json")
  var json = jsonUnmarshal[seq[Provinsi]](res)
  return json

proc getListKota*(idWilayah: string): seq[Kota] = 
  var res: string = newApiRequest(c, HttpGet, "/regencies/"&fmt"{idWilayah}.json")
  var json = jsonUnmarshal[seq[Kota]](res)
  return json

proc getListKota*(idWilayah: int): seq[Kota] = 
  var res = newApiRequest(c, HttpGet, "/regencies/"&fmt"{$idWilayah}.json")
  var json = jsonUnmarshal[seq[Kota]](res)
  return json

proc getListKecamatan*(idWilayah: string): seq[Kecamatan] = 
  var res = newApiRequest(c, HttpGet, "/districts/"&fmt"{idWilayah}.json")
  var json = jsonUnmarshal[seq[Kecamatan]](res)
  return json

proc getListKecamatan*(idWilayah: int): seq[Kecamatan] = 
  var res = newApiRequest(c, HttpGet, "/districts/"&fmt"{$idWilayah}.json")
  var json = jsonUnmarshal[seq[Kecamatan]](res)
  return json

proc getListKelurahan*(idWilayah: string): seq[Kelurahan] = 
  var res = newApiRequest(c, HttpGet, "/villages/"&fmt"{idWilayah}.json")
  var json = jsonUnmarshal[seq[Kelurahan]](res)
  return json

proc getListKelurahan*(idWilayah: int): seq[Kelurahan] = 
  var res = newApiRequest(c, HttpGet, "/villages/"&fmt"{$idWilayah}.json")
  var json = jsonUnmarshal[seq[Kelurahan]](res)
  return json