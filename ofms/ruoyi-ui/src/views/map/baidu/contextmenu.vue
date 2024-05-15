<template>
  <baidu-map class="map" :center="center" :zoom="zoom" :scroll-wheel-zoom="true">
    <bm-context-menu>
      <bm-context-menu-item :callback="gotoBeijing" text="去北京"></bm-context-menu-item>
      <bm-context-menu-item :callback="gotoShanghai" text="去上海"></bm-context-menu-item>
      <bm-context-menu-item :callback="gotoNanjing" text="去南京"></bm-context-menu-item>
    </bm-context-menu>
  </baidu-map>
</template>

<script>
export default {
  name: 'contextmenu',
  data () {
    return {
      center: {
        lng: 116.404,
        lat: 39.915
      },
      zoom: 15
    }
  },
  methods: {
    gotoBeijing (e) {
      this.center = {
        lng: 116.404,
        lat: 39.915
      }
    },
    gotoShanghai (e) {
      this.center = {
        lng: 121.473354,
        lat: 31.238413
      }
    },gotoNanjing(e)
    {
      this.center = {
        lng: 118.767413,
        lat: 32.041544
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
