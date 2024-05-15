<template>
  <baidu-map class="map" :center="{lng: 116.404, lat: 39.915}" :zoom="15" :scroll-wheel-zoom="true" :mapStyle="mapStyle">
<!--    //缩放工具-->
    <bm-scale anchor="BMAP_ANCHOR_BOTTOM_RIGHT"></bm-scale>
<!--    //地图类型-->
    <bm-map-type :map-types="['BMAP_NORMAL_MAP', 'BMAP_HYBRID_MAP']" anchor="BMAP_ANCHOR_TOP_LEFT"></bm-map-type>
<!--    //比例尺-->
    <bm-navigation anchor="BMAP_ANCHOR_TOP_RIGHT"></bm-navigation>
<!--    //缩略图-->
    <bm-overview-map anchor="BMAP_ANCHOR_BOTTOM_LEFT" :isOpen="true"></bm-overview-map>
<!--    //定位空间-->
    <bm-geolocation anchor="BMAP_ANCHOR_BOTTOM_RIGHT" :showAddressBar="true" :autoLocation="true"></bm-geolocation>
  </baidu-map>
</template>

<script>
export default {
  name: 'theme',
  data(){
    return {
      mapStyle: {
        styleJson: [
          {
            "featureType": "all",
            "elementType": "geometry",
            "stylers": {
              "hue": "#007fff",
              "saturation": 89
            }
          },
          {
            "featureType": "water",
            "elementType": "all",
            "stylers": {
              "color": "#ffffff"
            }
          }
        ]
      }
    }
  }
}
</script>

<style scoped>
.map {
  width: 100%;
  height: 650px;
}
</style>
