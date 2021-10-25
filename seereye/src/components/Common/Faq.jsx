import React from 'react';
import { useTranslation } from 'react-i18next';
import {
  Accordion,
  AccordionItem,
  AccordionItemHeading,
  AccordionItemPanel,
  AccordionItemButton
} from 'react-accessible-accordion';

const Faq = ({ data }) => {
  const { t } = useTranslation()
  const questions = [
    {
      question: t("faq.question1.question"),
      answer: t("faq.question1.answer")
    },
    {
      question: t("faq.question2.question"),
      answer: t("faq.question2.answer")
    }
  ]
  return (
    <section id="faq" className="faq-area ptb-80">
      {console.log("faq: ", data)}
      <div className="container">
        <div className="section-title">
          <h2>{data.title}</h2>
          <p>{data.subtitle}</p>
        </div>

        <div className="row">
          <div className="col-lg-7 col-md-12">
            <div className="accordion" id="accordionEx" role="tablist" aria-multiselectable="true">
              <Accordion>
                {
                  data.questionsCollection.items.map((question, i) =>

                    <AccordionItem key={i}>
                      <AccordionItemHeading>
                        <AccordionItemButton>
                          {question.title}
                        </AccordionItemButton>
                      </AccordionItemHeading>
                      <AccordionItemPanel>
                        <p>{question.content}</p>
                      </AccordionItemPanel>
                    </AccordionItem>
                  )
                }

              </Accordion>
            </div>
          </div>

          <div className="col-lg-5 col-md-12">
            <div className="image"></div>
          </div>
        </div>
      </div>
    </section>
  );
}


export default Faq;