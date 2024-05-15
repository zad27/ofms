<template>
  <baidu-map class="map" center="北京" :zoom="15" :scroll-wheel-zoom="true">
<!--    //城市列表-->
    <bm-city-list anchor="BMAP_ANCHOR_TOP_LEFT"></bm-city-list>
<!--    //缩放工具-->
<!--    <bm-scale anchor="BMAP_ANCHOR_BOTTOM_RIGHT"></bm-scale>-->
<!--    //地图类型-->
    <bm-map-type :map-types="['BMAP_NORMAL_MAP', 'BMAP_HYBRID_MAP']" anchor="BMAP_ANCHOR_TOP_RIGHT"></bm-map-type>
<!--    //比例尺-->
    <bm-navigation anchor="BMAP_ANCHOR_BOTTOM_RIGHT"></bm-navigation>
<!--    //缩略图-->
    <bm-overview-map anchor="BMAP_ANCHOR_BOTTOM_LEFT" :isOpen="true"></bm-overview-map>
<!--    定位空间-->
    <bm-geolocation anchor="BMAP_ANCHOR_BOTTOM_RIGHT" :showAddressBar="true" :autoLocation="true"></bm-geolocation>

  </baidu-map>
</template>

<script>
export default {
  name: 'citylist'
}
</script>

<style scoped>
.map {
  width: 100%;
  height: 650px;
}
</style>
