import React from 'react';
import AnchorLink from 'react-anchor-link-smooth-scroll';
import { useTranslation } from 'react-i18next';

const Ctr = () => {
    const { t } = useTranslation()
    return (
        <section className="ctr-area ptb-80">
            <div className="container">
                <div className="row">
                    <div className="col-lg-12 col-md-12">
                        <div className="section-title mb-0">
                            <h2>{t("ctrl-area.title")}</h2>
                            <p>{t("ctrl-area.content")}</p>
                            <AnchorLink href="#download" className="btn btn-primary">{t("ctrl-area.button")}</AnchorLink>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    );
};

export default Ctr;