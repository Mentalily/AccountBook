@Entry
@Component
struct Home {
  @State message: string = '欢迎使用小钱管家';

  build() {
    Column() {
      Row() {
        Text("今日已支出：")
          .fontSize(25)

      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .height(42)
      .backgroundColor(Color.Gray)
      .padding({
        top : 4,
        bottom : 4
      })


      Text(this.message)
        .id('HelloUser')
        .fontColor(Color.Orange)
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
        .padding({bottom : 100})
      ExpenditureDetails()
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.Pink)
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