/*
 * 账本总览
 */

import { router } from '@kit.ArkUI'
@Entry
@Component
struct AccountBooksPreview {
  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Image($r('app.media.ic_public_arrow_left'))
          .width(30)
          .margin({left : 10})
        Text("账本总览")
          .fontSize(25)
        Image($r('app.media.ic_public_share'))
          .width(30)
          .margin({right : 10})
      }
      .height(42)
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      // 涉及到路由传参的知识点
      Row() {
        Stack() {
        
        }
      }
      // 底部导航栏
      Row() {
        // 账本区
        Image($r('app.media.ic_public_albums_filled'))
          .width($r('app.float.navigation_icon_width'))
          .margin({left : $r('app.float.bottom_navigation_margin')})
        // 明细区
        Image($r('app.media.ic_public_add_norm'))
          .width($r('app.float.navigation_icon_width'))
          .onClick(()=>{
            router.pushUrl({
              url : 'pages/Home'
            })
          })
        // 资产区
        Image($r('app.media.ic_public_contacts'))
          .width($r('app.float.navigation_icon_width'))
          .margin({right : $r('app.float.bottom_navigation_margin')})
          .onClick(()=>{
            router.pushUrl({
              url : 'pages/User'
            })
          })
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