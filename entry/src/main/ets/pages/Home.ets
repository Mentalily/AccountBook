@Entry
@Component
struct Home {
  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Text("今日已支出：")
          .fontSize(25)
          // .layoutWeight(1)

        Image($r('app.media.ic_public_share'))
          .width(25)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .height(42)
      .backgroundColor(Color.Gray)
      .padding({
        top : 4,
        bottom : 4
      })

      TextInput()

      ExpenditureDetails()

      // 底部导航栏
      Row() {
        Image($r('app.media.ic_public_albums'))
          .width(30)
          .margin({left : 10})
        Image($r('app.media.ic_public_add_norm_filled'))
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
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    // .backgroundColor(Color.Pink)
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