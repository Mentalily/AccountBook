/**
 * 用户页面显示
 */
import { router } from '@kit.ArkUI'

@Entry
@Component
struct User {
  @State userName : string = "admin"
  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Image($r('app.media.ic_public_arrow_left'))
          .width($r('app.float.arrow_left_width'))
          .margin({
            left : $r('app.float.arrow_left_margin')
          })
        Text("你好，"+this.userName)
          .fontSize($r('app.float.top_navigation_text_fontsize'))

        Image($r('app.media.ic_public_settings'))
          .width($r('app.float.navigation_icon_width'))
          .margin({
            right : $r('app.float.top_navigation_margin')
          })
      }
      .width('100%')
      .height($r('app.float.top_navigation_bar_height'))
      .border({
        width : {
          top : $r('app.float.top_navigation_bar_border_width'),
          bottom : $r('app.float.top_navigation_bar_border_width')
        }
      })
      .justifyContent(FlexAlign.SpaceBetween)

      // 头像、壁纸
      Column() {
        Text("今天你记账了吗？")
          .fontSize(40)
            // .backgroundColor(Color.Brown)
          .width('100%')
        Image($r('app.media.ic_user_portrait'))
          .width(50)
      }
      .backgroundColor(Color.Gray)
      .height(100)
      .width('100%')
      .layoutWeight(1)
      // .alignItems(HorizontalAlign.End)

      // 正文
      Column()
      {
        Row(){

        }
        .height(10)
        // 资产明细
        Scroll()
        // AssetDetails()
      }
      .layoutWeight(9)
      .width('100%')
      // .alignItems(HorizontalAlign.Center)
      // .justifyContent(FlexAlign.Center)

      // 底部导航栏
      Row() {
        // 账本区
        Image($r('app.media.ic_public_albums'))
          .width($r('app.float.navigation_icon_width'))
          .margin({left : $r('app.float.bottom_navigation_margin')})
          .onClick(()=>{
            router.pushUrl({
              url : 'pages/AccountBooksPreview'
            })
          })
        // 明细区
        Image($r('app.media.ic_public_add_norm'))
          .width($r('app.float.navigation_icon_width'))
          .onClick(()=>{
            router.pushUrl({
              url : 'pages/Home'
            })
          })
        // 资产区
        Image($r('app.media.ic_public_contacts_filled'))
          .width($r('app.float.navigation_icon_width'))
          .margin({right : $r('app.float.bottom_navigation_margin')})
          .fillColor($r('app.color.user_fill'))
      }
      .width('100%')
      .height($r('app.float.bottom_navigation_bar_height'))
      .border({
        width : {
          top : $r('app.float.bottom_navigation_bar_border_width'),
          bottom : $r('app.float.bottom_navigation_bar_border_width')
        },
        color : {
          top : Color.Black,
          bottom : Color.Black
        }
      })
      .justifyContent(FlexAlign.SpaceBetween)

    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

@Component
struct AssetDetails {
  build() {
    Row() {

    }
  }
}