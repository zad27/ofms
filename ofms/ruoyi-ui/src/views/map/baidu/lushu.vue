<template>
  <baidu-map class="map" :center="{lng: 116.404, lat: 39.915}" :zoom="11" :scroll-wheel-zoom="true">
    <bm-driving start="天安门" end="百度大厦" @searchcomplete="handleSearchComplete" :panel="false" :autoViewport="true"></bm-driving>
    <bml-lushu
      @stop="reset"
      :path="path"
      :icon="icon"
      :play="play"
      :rotation="true">
    </bml-lushu>
  </baidu-map>
</template>

<script>
import {BmlLushu} from 'vue-baidu-map'
export default {
  name: 'lushu',
  components: {
    BmlLushu
  },
  data () {
    return {
      play: true,
      path: [],
      icon: {
        url: 'http://api.map.baidu.com/library/LuShu/1.2/examples/car.png',
        size: {width: 52, height: 26},
        opts: {anchor: {width: 27, height:13}}
      }
    }
  },
  methods: {
    reset () {
      this.play = false
    },
    handleSearchComplete (res) {
      this.path = res.getPlan(0).getRoute(0).getPath()
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
