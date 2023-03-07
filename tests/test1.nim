import unittest
import wilayahindonesia/utils
import os

test "unmarshal json data":
  const mockResponse = """[{"id":"11","name":"ACEH"}]"""
  var json: seq[Provinsi] = jsonUnmarshal[seq[Provinsi]](mockResponse)

  check json.len == 1
  check json[0].id == "11"

test "rest api request":
  const mockResponse = """[{"id":"11","name":"ACEH"}]"""

  proc getListProvinsi(): seq[Provinsi] = 
    var res = mockResponse
    var json = jsonUnmarshal[seq[Provinsi]](res)
    return json

  check getListProvinsi().len == 1
  