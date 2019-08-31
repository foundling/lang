const { reactive, Variable, not, or, and, eq, Div, Span } = alkali

class Header extends Div.with('.modal-header', {
  tabIndex: -1,
}) {
  created(props) {
    this.controls = new Div('.modal-controls')
    this.icons = new Div('.modal-icons')
    this.info = new Div('.modal-title', [
      props.icon ? Span(`.title-icon.fa.${props.icon}`) : undefined,
      Span('.title-text', {
        content: props.titleText || '',
      }),
    ])
    this.append(
      this.info,
      this.controls,
      this.icons,
    )
  }
}

const h = new Header({ titleText: reactive('Hiii') })
document.body.appendChild(h)
