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
