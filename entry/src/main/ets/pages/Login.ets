/*
 * 设置一个简单的登录页面
 * 暂时只有页面没有功能
 * */
import { router } from '@kit.ArkUI'

@Entry
@Component
struct Login {
  @State message : string = "登录成功"
  build() {
    Column({space : 15}){
      Image($r('app.media.foreground'))
        .width(222)
      Text("👋欢迎使用小钱管家😊")
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Black)
        .height(50)
      TextInput({
        placeholder : "请输入邮箱"
      })
        .type(InputType.Email)
      TextInput({
        placeholder : "请输入密码"
      })
        .type(InputType.Password)
      Button("登录")
        .width('100%')
        .backgroundColor(Color.Black)
        .onClick(()=>{
          router.replaceUrl({
            url : 'pages/Home'
          })
        })
    }
    .height('100%')
    .width('100%')
    .backgroundColor(Color.White)
    .padding(20)
  }
}