<template>
  <baidu-map class="map" :center="{lng: 116.404, lat: 39.915}" :zoom="15" :mapType="mapType" :scroll-wheel-zoom="true">
    <bm-scale anchor="BMAP_ANCHOR_BOTTOM_RIGHT"></bm-scale>
    <bm-map-type :map-types="['BMAP_NORMAL_MAP', 'BMAP_HYBRID_MAP']" anchor="BMAP_ANCHOR_TOP_LEFT"></bm-map-type>
    <bm-navigation anchor="BMAP_ANCHOR_TOP_RIGHT"></bm-navigation>
  </baidu-map>
</template>

<script>
export default {
  name: 'maptype',
  data(){
    return {
      mapType:'BMAP_SATELLITE_MAP'
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
