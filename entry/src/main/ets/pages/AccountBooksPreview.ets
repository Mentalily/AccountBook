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
          .width($r('app.float.arrow_left_width'))
          .margin({left : $r('app.float.arrow_left_margin')})
        Text("账本总览")
          .fontSize($r('app.float.top_navigation_text_fontsize'))
        Image($r('app.media.ic_public_share'))
          .width($r('app.float.navigation_icon_width'))
          .margin({right : $r('app.float.top_navigation_margin')})
      }
      .width('100%')
      .height($r('app.float.top_navigation_bar_height'))
      .border({
        width : {
          top : $r('app.float.top_navigation_bar_border_width'),
          bottom : $r('app.float.top_navigation_bar_border_width')
        },
        color : {
          top : Color.Black,
          bottom : Color.Black
        }
      })
      .justifyContent(FlexAlign.SpaceBetween)

      // 涉及到路由传参的知识点
      // 数据显示区
      Column(){

      }
      .backgroundColor(Color.Gray)
      // .height('40%')
      .width('100%')
      .layoutWeight(4)

      Column(){
        // 输入框
        Row(){
          Image($r('app.media.ic_public_input_voice'))
            .width(40)
            .margin({
              top : 5,
              bottom : 5
            })

          TextInput({
            placeholder : "记账区"
          })
            .height(50)
            .backgroundColor(Color.White)
            .borderRadius(0)
            .border({
              width : {
                left : 2,
                right : 2
              }
            })
            .layoutWeight(1)
          Image($r('app.media.ic_public_more_list'))
            .width(40)
            .margin({
              top : 5,
              bottom : 5
            })

        }
        .width('90%')
        .height(50)
        .justifyContent(FlexAlign.SpaceBetween)
        .border({
          width : 3
        })
        .borderRadius(10)

        Scroll(){
          // ExpenditureDetails()
          // ExpenditureDetails()
          // ExpenditureDetails()
        }
      }
      .layoutWeight(5)
      .width('100%')
      .padding(10)


      // 底部导航栏
      Row() {
        // 账本区
        Image($r('app.media.ic_public_albums_filled'))
          .width($r('app.float.navigation_icon_width'))
          .margin({left : $r('app.float.bottom_navigation_margin')})
          .fillColor($r('app.color.accountbook_fill'))
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