# Shopping cart api

- Make a http request (`lib/src/shop_api.dart`) agains the raw version of <https://gist.github.com/passsy/d3953caca39f4d1c548e3d232cee1f71>
- Parse json into dart objects (`ProductDTO`)
  - Try manually first, but you can use any library you want afterwards
  - Caution, price might be tricky
- Write an end-to-end test against the real api (see `end2end_test/e2e_test.dart`)
