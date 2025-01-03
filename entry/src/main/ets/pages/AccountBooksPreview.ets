/*
 * 账本总览
 */
@Preview
@Component
struct AccountBooksPreview {
  build() {
    Column() {
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

      Row() {
        Stack() {
        
        }
      }
      // 底部导航栏
      Row() {
        Image($r('app.media.ic_public_albums_filled'))
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
  }
}