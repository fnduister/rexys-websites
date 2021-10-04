import React from 'react';
import AnchorLink from 'react-anchor-link-smooth-scroll';
import { useTranslation } from 'react-i18next';
import fact_check from "../../assets/pdfs/seer_eye_fact_sheet_1.0.pdf"

const Ctr = () => {
    const { t } = useTranslation()
    return (
        <section id="more" className="ctr-area ptb-80">
            <div className="container">
                <div className="row">
                    <div className="col-lg-12 col-md-12">
                        <div className="section-title mb-0">
                            <h2>{t("ctrl-area.title")}</h2>
                            <p>{t("ctrl-area.content")}</p>
                            <a download href={fact_check} className="btn btn-primary">{t("ctrl-area.buttons.view_more")}</a>
                            <a download href={fact_check} className="btn btn-primary view-work">{t("ctrl-area.buttons.get_started")}</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    );
};

export default Ctr;