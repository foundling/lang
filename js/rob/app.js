import {
  Form,
  Span,
  TextArea
} from 'alkali'
import RiskOfBiasRatingGroup as RatingGroup from './RiskOfBiasRatingGroup'

export default class RiskOfBiasForm extends Form {

  ready(props) {

    const { placeholderText, questionText } = props

    this.append(
      Div('.rob-question-header', [
        I('.fa-exclamation-circle'), // this is going to be a tooltip
        Span(questionText)
      ]),
      Div('.rob-question-body', [
        TextArea('.rob-question', {
          placeholderText
        }),
        RatingGroup()  
      ])
    )
  }
}
import {
  LI,
  Span,
  UL
} from 'alkali'

export default RiskOfBiasRating extends UL {
  ready(props) {

    const ratings = [
      'Yes (Low Risk)',
      'No (High Risk)',
      'Unclear'
    ]
    const icons = [
      'fa-plus-circle',
      'fa-minus-circle',
      'fa-ban'
    ]
    const classes = [
      'yes',
      'no',
      'unclear'
    ]

    this.append(
      _.zip[ratings, icons, classes]
      .map(([rating,icon, className]) => LI(`.rob-rating-${className}`, [ 
          I('.fa-circle'), 
          rating 
        ])),
    )

  }
}
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
