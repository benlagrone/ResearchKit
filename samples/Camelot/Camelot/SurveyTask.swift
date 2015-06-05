//
//  SurveyTask.swift
//  Camelot
//
//  Created by Atina,Hope N on 5/28/15.
//  Copyright (c) 2015 Atina,Hope N. All rights reserved.
//

import Foundation
import ResearchKit

public var SurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    //TODO: add instructions step
    
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "Post Surgery Toxicity "
    instructionStep.text = "Please answer the following questions. Please try to answer based on factual values."
    steps += [instructionStep]
    
    //TODO: add name question
    let nameAnswerFormat = ORKTextAnswerFormat(maximumLength: 20)
    let nameAnswerFormat2 = ORKBooleanAnswerFormat()
    
    nameAnswerFormat.multipleLines = false
    let nameQuestionStepTitle = "Did you throw up today"
    let nameQuestionStep = ORKQuestionStep(identifier: "QuestionStep", title: nameQuestionStepTitle, answer: nameAnswerFormat2)
    steps += [nameQuestionStep]
    
    
    //TODO: add 'what is your quest' question
    let questQuestionStepTitle = "How are you feeling today?"
    let textChoices = [
        ORKTextChoice(text: "Terrible", value: 0),
        ORKTextChoice(text: "Okay", value: 1),
        ORKTextChoice(text: "Good", value: 2),
        ORKTextChoice(text: "Never been better", value: 3)
        
    ]
    let questAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: textChoices)
    let questQuestionStep = ORKQuestionStep(identifier: "TextChoiceQuestionStep", title: questQuestionStepTitle, answer: questAnswerFormat)
    steps += [questQuestionStep]
    //TODO: add question about Temperature
    let tempQuestionStepTitle = "What is your current body temperature?"
    
    let localizedQuestionStep1AnswerFormatUnit = NSLocalizedString("Farhenheit", comment: "temperature")
    let questionStep1AnswerFormat = ORKAnswerFormat.decimalAnswerFormatWithUnit(localizedQuestionStep1AnswerFormatUnit)
    
    let tempQuestionStep = ORKQuestionStep(identifier: "Temperature", title: tempQuestionStepTitle, answer: questionStep1AnswerFormat)
    
    //tempQuestionStep.text = exampleDetailText
    tempQuestionStep.placeholder = NSLocalizedString("Temperature", comment: "")
    
    steps += [tempQuestionStep]
    
    //TODO: add question about Dehydration
    
    let quesDehydrationStep = ORKQuestionResult(identifier: "Dehydration")
    
    
    //TODO: add question about Loss of weight
    
    //TODO: add question about Diarrhea
    
    //TODO: add question about Vomiting (find a way to passive)
   
    
    //TODO: add color question step
    let colorQuestionStepTitle = "What is your favorite color?"
    let colorTuples = [
        (UIImage(named: "red")!, "Red"),
        (UIImage(named: "orange")!, "Orange"),
        (UIImage(named: "yellow")!, "Yellow"),
        (UIImage(named: "green")!, "Green"),
        (UIImage(named: "blue")!, "Blue"),
        (UIImage(named: "purple")!, "Purple")
    ]
    let imageChoices : [ORKImageChoice] = colorTuples.map {
        return ORKImageChoice(normalImage: $0.0, selectedImage: nil, text: $0.1, value: $0.1)
    }
    let colorAnswerFormat: ORKImageChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithImageChoices(imageChoices)
    let colorQuestionStep = ORKQuestionStep(identifier: "ImageChoiceQuestionStep", title: colorQuestionStepTitle, answer: colorAnswerFormat)
    steps += [colorQuestionStep]
    
    
    //TODO: add summary step
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Right. Off you go!"
    summaryStep.text = "That was easy!"
    steps += [summaryStep]
    
    
    return ORKOrderedTask(identifier: "SurveyTask", steps: steps)
}
