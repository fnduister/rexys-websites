

export const query = (language) => `
fragment headerContentFragment on HeaderContent {
  title
  subtitle1
  content
  accessProjectButton
  viewProjectsButton
  navigation
  background
}

fragment contactContentFragment on ContactSection {
  title
  subtitle
  titleContent
  formTitle
  formName
  formEmail
  formMessage
  formSend
  formPhone
  formTitle
}

fragment welcomeSectionFragment on WelcomeSection {
  title
  contentTitle
  contentsCollection {
    items {
      ...boxContentFragment
    }
  }
}

fragment strategySectionFragment on Strategy {
  title
  subtitle
  content
  strategyList
}

fragment boxContentFragment on BoxWithTitleAndContent {
  title
  content
  background
}

fragment ctrlContentFragment on CtrlSection {
  title
  content
  downloadButton
  accessProjectButton
}

fragment WhoWeAreContentFragment on WhoWeAreSection {
  title
  contentTitle
  boxContentCollection {
    items {
      ...boxContentFragment
    }
  }
}

fragment WhoWeServeContentFragment on WhoWeServe {
  content
  title
  informationsCollection{
    items {
      ...boxContentFragment
    }
  }
}

fragment FaqContentFragment on FaqSection {
  title
  subtitle
  questionsCollection{
    items {
      ...boxContentFragment
    }
  }
}


{
  webSite(id: "4qQgKIW0q4JrS8rTiQGaWe", locale: "${language === 'fr' ? 'fr' : 'en-US'}") {
    siteName
    headersCollection {
      items {
        ...headerContentFragment
      }
    }
    navigation
    sectionsCollection {
      items {
        ...welcomeSectionFragment
        ...contactContentFragment
        ...WhoWeAreContentFragment
        ...strategySectionFragment
        ...ctrlContentFragment
        ...WhoWeServeContentFragment
        ...FaqContentFragment
      }
    }
  }
}
`