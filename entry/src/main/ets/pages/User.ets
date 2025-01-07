/**
 * 用户页面显示
 */
import { router } from '@kit.ArkUI'

@Entry
@Component
struct User {
  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Text("你好")
          .fontSize(40)
      }
      .width('100%')
      .height(50)
      .justifyContent(FlexAlign.Center)
      // 正文
      Column()
      {
        // 头像、壁纸
        Row() {

        }
        // 资产明细
        AssetDetails()
      }

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