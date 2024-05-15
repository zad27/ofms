<template>
  <baidu-map class="map" :center="{lng: 116.332782, lat: 40.007978}" :zoom="14" :scroll-wheel-zoom="true">
    <bm-traffic :predictDate="{weekday: 7, hour: 12}">
    </bm-traffic>
  </baidu-map>
</template>

<script>
export default {
  name: 'traffic'
}
</script>

<style scoped>
.map {
  width: 100%;
  height: 650px;
}
</style>
