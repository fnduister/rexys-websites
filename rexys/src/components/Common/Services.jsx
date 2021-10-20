import React, { useEffect } from 'react';
import imgOne from '../../assets/images/rexys/globe.jpg';
import imgTwo from '../../assets/images/rexys/circuit.jpg';
import imgThree from '../../assets/images/rexys/appareil-photo.jpg';
import { useTranslation } from 'react-i18next';

const Services = ({ data }) => {
  const { t } = useTranslation()

  // useEffect(() => {
  //   if (data) {
  //     items = data.contentsCollection.items
  //     console.log('🚀 ~ useEffect ~ items', items);
  //   }
  // }, [data, items])

  return (
    <section id="services" className="services-area ptb-80">

      <div className="container">
        <div className="section-title">
          <h2>{data.title}</h2>
          <p>{data.contentTitle}</p>
        </div>

        <div className="row">
          <div className="col-lg-4 col-md-6">
            <div className="single-services">
              <div className="services-img">
                <img src={imgOne} alt="services-img" />

                <div className="icon">
                  <i className="fa fa-pencil-square-o"></i>
                </div>
              </div>

              <div className="services-content">
                <h3>{data.contentsCollection.items[0].title}</h3>
                <p>{data.contentsCollection.items[0].content}</p>
              </div>
            </div>
          </div>

          <div className="col-lg-4 col-md-6">
            <div className="single-services">
              <div className="services-img">
                <img src={imgTwo} alt="services-img" />

                <div className="icon">
                  <i className="fa fa-linode"></i>
                </div>
              </div>
                <div className="services-content">
                  <h3>{data.contentsCollection.items[1].title}</h3>
                <p>{data.contentsCollection.items[1].content}</p>
                </div>
            </div>
          </div>

          <div className="col-lg-4 col-md-6">
            <div className="single-services">
              <div className="services-img">
                <img src={imgThree} alt="services-img" />

                <div className="icon">
                  <i className="fa fa-desktop"></i>
                </div>
              </div>

              <div className="services-content">
                <h3>{data.contentsCollection.items[2].title}</h3>
                <p>{data.contentsCollection.items[2].content}</p>
              </div>
            </div>
          </div>

        </div>
      </div>
    </section>
  )
}


export default Services;