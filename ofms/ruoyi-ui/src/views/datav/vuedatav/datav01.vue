<template>
  <div class="maindiv">
    <el-row class="row-bg" >
      <el-col :span="24">
        <dv-border-box-10>
          <el-row type="flex" class="row-bg" justify="space-around">
            <el-col :span="24" style="height: 150px;">
              <dv-border-box-11 title="大数据展示屏">

              </dv-border-box-11>
            </el-col>
          </el-row>
          <el-row type="flex"  class="row-bg" justify="space-around" style="height: 300px;">
            <el-col :span="24" style="height: 200px;margin: 10px;">
                    <dv-scroll-board :config="config" style="width:100%;height:220px" />
                  </el-col>
          </el-row>
        </dv-border-box-10>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'datav01',
  data(){
    return{
      config:{
        header: ['列1', '列2', '列3'],
        data: [
          ['<span style="color:#37a2da;">行1列1</span>', '行1列2', '行1列3'],
          ['行2列1', '<span style="color:#32c5e9;">行2列2</span>', '行2列3'],
          ['行3列1', '行3列2', '<span style="color:#67e0e3;">行3列3</span>'],
          ['行4列1', '<span style="color:#9fe6b8;">行4列2</span>', '行4列3'],
          ['<span style="color:#ffdb5c;">行5列1</span>', '行5列2', '行5列3'],
          ['行6列1', '<span style="color:#ff9f7f;">行6列2</span>', '行6列3'],
          ['行7列1', '行7列2', '<span style="color:#fb7293;">行7列3</span>'],
          ['行8列1', '<span style="color:#e062ae;">行8列2</span>', '行8列3'],
          ['<span style="color:#e690d1;">行9列1</span>', '行9列2', '行9列3'],
          ['行10列1', '<span style="color:#e7bcf3;">行10列2</span>', '行10列3']
        ],
        index: true,
        columnWidth: [50],
        align: ['center']
      }
    }
  }
}
</script>

<style scoped>
.maindiv {
  width: 100%;
  height: 650px;
  background-image: url('../../../assets/images/datavbg.png');
}

.el-row {
  margin-bottom: 10px;
  padding: 0 10px;
}
.el-col {
  border-radius: 4px;
}
.bg-purple {
  background: #d3dce6;
}
.grid-content {
  border-radius: 4px;
  min-height: 36px;
}
.row-bg {
  padding: 0;
  /*background-color:;*/
}
</style>
