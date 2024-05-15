<template>
  <baidu-map class="map" :center="{lng: 116.332782, lat: 40.007978}" :zoom="16" :scroll-wheel-zoom="true">
    <bm-tile
      :isTransparentPng="true"
      tileUrlTemplate="//developer.baidu.com/map/jsdemo/demo/tiles/{Z}/tile{X}_{Y}.png">
    </bm-tile>
  </baidu-map>
</template>

<script>
export default {
  name: 'transparentpng'
}
</script>

<style scoped>
.map {
  width: 100%;
  height: 650px;
}
</style>
