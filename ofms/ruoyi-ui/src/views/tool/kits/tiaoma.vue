<template>
    <barcode :value="barcodes" :options="barcode_option" tag="svg" ></barcode>

</template>

<script>
export default {
  name: 'tiaoma',
  data(){
    return {
      barcode_option:{
        displayValue: true, //是否默认显示条形码数据
        textPosition  :'bottom', //条形码数据显示的位置
        background: '#fff', //条形码背景颜色
        valid: function (valid) {
          console.log(valid)
        },
        width:'1px',//单个条形码的宽度
        height: '20px',
        fontSize: '16px', //字体大小
        lineColor:"#11A983",
        format: "CODE128",//选择要使用的条形码类型
        // width:3,//设置条之间的宽度
        // height:100,//高度
        // displayValue:true,//是否在条形码下方显示文字
        // text:"456",//覆盖显示的文本
        // fontOptions:"bold italic",//使文字加粗体或变斜体
        // font:"fantasy",//设置文本的字体
        // textAlign:"left",//设置文本的水平对齐方式
        // textPosition:"top",//设置文本的垂直位置
        // textMargin:5,//设置条形码和文本之间的间距
        // fontSize:15,//设置文本的大小
        // background:"#eee",//设置条形码的背景
        // margin:15//设置条形码周围的空白边距
      },
      barcodes:'AB00DLSK-13-9'

    }
  }
}
</script>

<style scoped>

</style>
