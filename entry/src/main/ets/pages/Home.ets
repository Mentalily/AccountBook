@Entry
@Component
struct Home {
  @State message: string = '欢迎使用小钱管家';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloUser')
        .fontColor(Color.Orange)
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}