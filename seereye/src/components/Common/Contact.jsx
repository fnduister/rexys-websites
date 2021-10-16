import React, {useState} from 'react';
import { Link } from "react-router-dom";
import 'isomorphic-fetch';
import { useTranslation } from 'react-i18next';


const Contact = () => {
    const {t} = useTranslation()
    const [state, setState] = useState({
        submitting: false,
        submitted: false,
        buttonState: '',
        formFields: {
            name: '',
            email: '',
            phone: '',
            text: ''
        }
    });

    const onSubmit = (e) => {
        e.preventDefault();
        const data = state.formFields;
        fetch('/api/contact', {
            method: 'post',
            headers: {
                'Accept': 'application/json, text/plain, */*',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        }).then(res => {
            if (res.status === 200) {
                setState({ submitted: true })
            }
            let formFields = Object.assign({}, state.formFields);
            formFields.name = '';
            formFields.email = '';
            formFields.phone = '';
            formFields.text = '';
            setState({ formFields });
        });
    }

    const nameChangeHandler = (e) => {
        let formFields = Object.assign({}, state.formFields);
        formFields.name = e.target.value;
        setState({ formFields });
    }

    const emailChangeHandler = (e) => {
        let formFields = Object.assign({}, state.formFields);
        formFields.email = e.target.value;
        setState({ formFields });
    }

    const phoneChangeHandler = (e) => {
        let formFields = Object.assign({}, state.formFields);
        formFields.phone = e.target.value;
        setState({ formFields });
    }

    const textChangeHandler = (e) => {
        let formFields = Object.assign({}, state.formFields);
        formFields.text = e.target.value;
        setState({ formFields });
    }

    const onHideSuccess = () => {
        setState({ submitted: false });
    }

    const successMessage = () => {
        if (state.submitted) {
            return (
                <div
                    className="alert alert-success alert-dismissible fade show"
                    style={{ marginTop: '14px' }}
                >
                    <strong>Thank you!</strong> Your message is send to the owner.
                    <button
                        type="button"
                        className="close"
                        onClick={onHideSuccess}
                    >
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            );
        }
    }

    return (
        <section id="contact" className="contact-area ptb-80 bg-f6f6f6">
            <div className="container">
                <div className="section-title">
                    <h4>{t("contact.title")}</h4>
                    <h2>{t("contact.subtitle1")} <span>{t("contact.subtitle2")}</span> {t("contact.subtitle3")}</h2>
                    <p>{t("contact.title_content")}</p>
                </div>

                <div className="row">
                    <div className="col-lg-6 col-md-12" >
                        <div className="contact-form">
                            <h4>{t("contact.form.stay_connected")}</h4>
                            <form id="contactForm" onSubmit={onSubmit}>
                                <div className="row">
                                    <div className="col-lg-12 col-md-6">
                                        <div className="form-group">
                                            <label htmlFor="name">{t("contact.form.name")}</label>
                                            <input
                                                type="text"
                                                className="form-control"
                                                name="name"
                                                id="name"
                                                required={true}
                                                data-error="Please enter your name"
                                                value={state.formFields.name}
                                                onChange={nameChangeHandler}
                                            />
                                            <div className="help-block with-errors"></div>
                                        </div>
                                    </div>

                                    <div className="col-lg-12 col-md-6">
                                        <div className="form-group">
                                            <label htmlFor="email">{t("contact.form.email")}</label>
                                            <input
                                                type="email"
                                                className="form-control"
                                                name="email"
                                                id="email"
                                                required={true}
                                                data-error="Please enter your email"
                                                value={state.formFields.email}
                                                onChange={emailChangeHandler}
                                            />
                                            <div className="help-block with-errors"></div>
                                        </div>
                                    </div>

                                    <div className="col-lg-12 col-md-12">
                                        <div className="form-group">
                                            <label htmlFor="number">{t("contact.form.phone")}</label>
                                            <input
                                                type="text"
                                                className="form-control"
                                                name="number"
                                                id="number"
                                                required={true}
                                                data-error="Please enter your number"
                                                value={state.formFields.phone}
                                                onChange={phoneChangeHandler}
                                            />
                                            <div className="help-block with-errors"></div>
                                        </div>
                                    </div>

                                    <div className="col-lg-12 col-md-12">
                                        <div className="form-group">
                                            <label htmlFor="message">{t("contact.form.message")}</label>
                                            <textarea
                                                name="message"
                                                className="form-control"
                                                id="message"
                                                cols="30"
                                                rows="4"
                                                required={true}
                                                data-error="Write your message"
                                                value={state.formFields.text}
                                                onChange={textChangeHandler}
                                            />
                                            <div className="help-block with-errors"></div>
                                        </div>
                                    </div>

                                    <div className="col-lg-12 col-md-12">
                                        <button type="submit" className="btn btn-primary">{t("contact.form.send")}</button>
                                        {successMessage()}
                                        <div className="clearfix"></div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    );
}

export default Contact;