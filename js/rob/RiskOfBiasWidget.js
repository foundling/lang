import Widget from 'components/generic/WidgetAlkali'
import {
  TextArea
} from 'alkali'

export default class RiskOfBiasWidget extends Widget.with(
  '.library-rob-widget', {
  head: {
    icon: 'fa-exclamation-circle',
    titleText: 'Risk of Bias'
  }
  }) {
  ready() {
  }
}
