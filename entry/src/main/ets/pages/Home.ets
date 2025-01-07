import { router } from '@kit.ArkUI'

@Entry
@Component
struct Home {
  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Text("今日已支出：")
          .fontSize(25)
        Blank()
        Image($r('app.media.ic_public_share'))
          .width(25)
      }
      .width('100%')
      .height($r('app.float.top_navigation_bar_height'))
      .alignItems(VerticalAlign.Center)
      // .justifyContent(FlexAlign.Center)
      // .backgroundColor(Color.Gray)
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
      // .padding({
      //   top : 4,
      //   bottom : 4
      // })

      TextInput()

      ExpenditureDetails()

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
        Image($r('app.media.ic_public_add_norm_filled'))
          .width($r('app.float.navigation_icon_width'))
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

// @Preview
@Component
struct ExpenditureDetails {
  build() {
    Row() {
      Text("早餐")
        .fontSize(25)
      Row() {
        Text("#生活")
          .fontSize(25)
          .margin({left : 15})
          .fontColor(Color.Orange)
        Text("-9.0")
          .fontSize(25)
          .fontColor(Color.Red)
      }
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({
      left : 10,
      right : 10
    })
  }
}