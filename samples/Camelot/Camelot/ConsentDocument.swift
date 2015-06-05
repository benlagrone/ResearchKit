//
//  ConsentDocument.swift
//  Camelot
//
//  Created by Atina,Hope N on 5/28/15.
//  Copyright (c) 2015 Atina,Hope N. All rights reserved.
//

import Foundation
import ResearchKit

public var ConsentDocument: ORKConsentDocument {

    let consentDocument = ORKConsentDocument()
    consentDocument.title  = "Example Consent"
    
    let consentSectionTypes: [ORKConsentSectionType] = [
    .Overview,
        .DataGathering,
        .Privacy,
        .DataUse,
        .TimeCommitment,
        .StudySurvey,
        .StudyTasks,
        .Withdrawing
    ]
    
    var consentSections: [ORKConsentSection] = consentSectionTypes.map { consentSectionTypes
        in
            let consentSection = ORKConsentSection(type: consentSectionTypes)
            consentSection.summary = "It you wish to complete this study..."
            consentSection.content = "In this study you will be asked five (wait no 3 thousand questions. You will also have your voice recirded for 10 seconds."
            return consentSection
    }
    
    consentDocument.sections = consentSections
    
    consentDocument.addSignature(ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "ConsentDocumentsParticipantSignature"))
    
    return consentDocument
    
}
