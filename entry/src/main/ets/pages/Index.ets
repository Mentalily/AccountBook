@Entry
@Component
struct Index {
  @State message: string = 'Hello User';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloUser')
        .fontColor(100)
        .fontSize(50)
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