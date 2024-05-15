<template>
  <baidu-map class="map" :scroll-wheel-zoom="true" :center="nearby.center" :zoom="15">
    <bm-view class="map"></bm-view>
    <bm-local-search keyword="餐馆" :nearby="nearby" :auto-viewport="true" :panel="true"></bm-local-search>
    <bm-circle :center="nearby.center" :radius="nearby.radius"></bm-circle>
  </baidu-map>
</template>

<script>
export default {
  name: 'nearby',
  data () {
    return {
      nearby: {
        center: {
          lng: 116.404,
          lat: 39.915
        },
        radius: 1000
      }
    }
  }
}
</script>

<style scoped>
.map {
  width: 100%;
  height: 350px;
}
</style>
