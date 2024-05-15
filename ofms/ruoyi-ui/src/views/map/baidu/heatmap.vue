<template>
  <baidu-map class="map" :center="centGps" :zoom="8" :scroll-wheel-zoom="true">
    <bm-map-type :map-types="['BMAP_NORMAL_MAP', 'BMAP_HYBRID_MAP']" anchor="BMAP_ANCHOR_TOP_RIGHT"></bm-map-type>
    <bml-heatmap :data="heatData" :max="100" :radius="20">
    </bml-heatmap>
    <bm-control>
      <el-select class="orgStye" v-model="orgValue" placeholder="请选择组织架构" clearable @change="orgChange">
        <el-option
          v-for="item in cities"
          :key="item.value"
          :label="item.label"
          :value="item.value">
          <span style="float: left">{{ item.label }}</span>
          <span style="float: right; color: #8492a6; font-size: 13px">{{ item.value }}</span>
        </el-option>
      </el-select>
    </bm-control>
  </baidu-map>
</template>

<script>
import {BmlHeatmap} from 'vue-baidu-map'
import { heatMapData } from './dataDemo.js'
export default {
  name: 'heatmap',
  components: {
    BmlHeatmap
  },
  data () {
    return {
      heatData: [],
      cities: [
        {
          value: 'Anhui',
          label: '安徽'
        },
        {
          value: 'Beijing',
          label: '北京'
        },
        {
          value: 'Chongqing',
          label: '重庆'
        },
        {
          value: 'Fujian',
          label: '福建'
        },
        {
          value: 'Gansu',
          label: '甘肃'
        },
        {
          value: 'Guangdong',
          label: '广东'
        },
        {
          value: 'Guangxi',
          label: '广西'
        },
        {
          value: 'Guizhou',
          label: '贵州'
        },
        {
          value: 'Hainan',
          label: '海南'
        },
        {
          value: 'Hebei',
          label: '河北'
        },
        {
          value: 'Heilongjiang',
          label: '黑龙江'
        },
        {
          value: 'Henan',
          label: '河南'
        },
        {
          value: 'Hubei',
          label: '湖北'
        },
        {
          value: 'Hunan',
          label: '湖南'
        },
        {
          value: 'Jiangsu',
          label: '江苏'
        },
        {
          value: 'Jiangxi',
          label: '江西'
        },
        {
          value: 'Jilin',
          label: '吉林'
        },
        {
          value: 'Liaoning',
          label: '辽宁'
        },
        {
          value: 'Neimenggu',
          label: '内蒙古'
        },
        {
          value: 'Ningxia',
          label: '宁夏'
        },
        {
          value: 'Qinghai',
          label: '青海'
        },
        {
          value: 'Shandong',
          label: '山东'
        },
        {
          value: 'Shanghai',
          label: '上海'
        },
        {
          value: 'Shanxi01',
          label: '山西'
        },
        {
          value: 'Shanxi02',
          label: '陕西'
        },
        {
          value: 'Shenzhen',
          label: '深圳'
        },
        {
          value: 'Sichuan',
          label: '四川'
        },
        {
          value: 'Tianjin',
          label: '天津'
        },
        {
          value: 'Xinjiang',
          label: '新疆'
        },
        {
          value: 'Xizang',
          label: '西藏'
        },
        {
          value: 'Yunnan',
          label: '云南'
        },
        {
          value: 'Zhejiang',
          label: '浙江'
        }
        ],
      orgValue: '',
      centGps:{lng:116.373027,lat:39.9462842},
    }
  },
  methods:{
    orgChange(value){
      this.heatData=heatMapData.get(value)
      if(this.heatData.length>0){
        // console.log(this.heatData[0])
        this.centGps={lng:this.heatData[0].lng,lat:this.heatData[0].lat }
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
.orgStye{
  margin-left: 20px;
  margin-top: 20px;
}
</style>
