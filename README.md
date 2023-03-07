# Wilayah Indonesia

Library ini diperuntukan untuk mempermudah pengambilan data wilayah indonesia . Data wilayah bersumber pada url [https://nekoding.github.io/api-wilayah-indonesia/](https://nekoding.github.io/api-wilayah-indonesia/). Anda dapat mengubah base url diatas dengan menambahkan konfigurasi env dengan kata kunci `WILAYAHINDO_BASEURL`

## Installation

```
nimble install wilayahindonesia
````

## Usage

```nim
import wilayahindonesia

var provinces = getListProvinsi()
var cities = getListKota(31)
var regencies = getListKecamatan(3172)
var villages = getListKelurahan(3172070)

echo provinces, cities, regencies, villages
```

## Thanks to:

- https://github.com/emsifa (Author API Wilayah Indonesia)
