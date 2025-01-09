/**
 * 单个账本收支明细显示
 * */
import { router } from '@kit.ArkUI'

@Entry
@Component
struct AccountBookDetails {
  build() {
    Column(){
      // 顶端导航栏
      Row() {
        Image($r('app.media.ic_public_arrow_left'))
          .width($r('app.float.arrow_left_width'))
          .margin({left : $r('app.float.arrow_left_margin')})
          .onClick(()=>{
            router.back()
          })
        Text("账本1")
          .fontSize($r('app.float.top_navigation_text_fontsize'))
        Image($r('app.media.ic_public_share'))
          .width($r('app.float.navigation_icon_width'))
          .margin({right : $r('app.float.top_navigation_margin')})
      }
      .height($r('app.float.top_navigation_bar_height'))
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .border({
        width : {
          top : $r('app.float.top_navigation_bar_border_width'),
          bottom : $r('app.float.top_navigation_bar_border_width')
        }
      })
      .backgroundColor(Color.White)
      // 数据显示
      Scroll() {
        Column() {
          DataShowBar()
          Row() {
            Column() {

            }
            Column() {

            }
        }

        }
      }
      .width('100%')
      .layoutWeight(1)




      // 底部导航栏
      Row() {
        Image($r('app.media.ic_public_albums_filled'))
          .width(30)
          .margin({left : 10})
          .fillColor($r('app.color.accountbook_fill'))
        Image($r('app.media.ic_public_add_norm'))
          .width(30)
        Image($r('app.media.ic_public_contacts'))
          .width(30)
          .margin({right : 10})
      }
      .width('100%')
      .height(45)
      .border({
        width : {
          top : 2,
          bottom : 2
        },
        color : {
          top : Color.Black,
          bottom : Color.Black
        }
      })
      .justifyContent(FlexAlign.SpaceBetween)
      .backgroundColor(Color.White)
    }

  }
}

@Component
struct DataShowBar {
  build() {
  }
}