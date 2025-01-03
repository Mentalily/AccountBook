/**
 * 用户页面显示
 */
@Preview
@Component
struct User {
  build() {
    Column() {
      // 顶部
      Row() {

      }
      // 正文
      Column()
      {
        // 头像、壁纸
        Row() {

        }
        // 资产明细
        AssetDetails()
      }
      // 底部
      Row() {
        Image($r('app.media.ic_public_albums'))
          .width(30)
          .margin({left : 10})
        Image($r('app.media.ic_public_add_norm'))
          .width(30)
        Image($r('app.media.ic_public_contacts'))
          .width(30)
          .margin({right : 10})
      }
      .width('100%')
      .height(45)
      .backgroundColor(Color.Brown)
      .justifyContent(FlexAlign.SpaceBetween)
    }
  }
}

@Component
struct AssetDetails {
  build() {
    Row() {

    }
  }
}