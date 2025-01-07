/*
 * 设置一个简单的登录页面
 * */
import { router } from '@kit.ArkUI'

@Entry
@Component
struct Login {
  build() {
    Column(){
      Text("登录页")
        .fontSize(50)
        .width('100%')
        .height(100)
      Button('登录到首页')
        .onClick(()=>{
          router.replaceUrl({
            url : "pages/Home"
          })
        })
    }
    .height('100%')
    .width('100%')
  }

}