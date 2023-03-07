import httpclient
import strutils
import json
import os

## Setup data structure
type
    Provinsi* = object
        id*: string
        name*: string

    Kota* = object
        id*: string
        province_id*: string
        name*: string
    
    Kecamatan* = object
        id*: string
        regency_id*: string
        name*: string
    
    Kelurahan* = object
        id*: string
        district_id*: string
        name*: string


## Base URL
## Thanks to : https://github.com/emsifa

const BASE_URL = "https://nekoding.github.io/api-wilayah-indonesia/api"
var baseUrl = getEnv("WILAYAHINDO_BASEURL", BASE_URL)

proc strip_url(s: string): string = 
    s.strip(chars={'/'})

proc newApiRequest*(c: HttpClient, httpMethod: HttpMethod, path: string): string = 
    let url: string = baseUrl&"/"&strip_url(path)
    echo url

    let resp: Response = c.request(
        url,
        httpMethod
    )

    if resp.status != "200 OK":
        raise newException(HttpRequestError, "failed get data from api")

    return resp.body

proc jsonUnmarshal*[T](s: string): T = 
    var json = parseJson(s)
    to(json, T)
