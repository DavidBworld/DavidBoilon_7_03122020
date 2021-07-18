import React from "react";

// Components
import Modal from "../Modal/Modal";
import UIBtn from "../Buttons/UIBtn/UIBtn";

// Styles
import styles from "./ErrorModal.module.css";

const ErrorModal = (props) => {
    return (
        <Modal
            onCancel={props.onClear}
            header="An Error Occurred!"
            show={!!props.error}
            footer={
                <UIBtn
                    id="accept-btn"
                    name="Ok"
                    type="submit"
                    btnType="warning"
                    onClick={props.onClear}
                    buttonClass={styles.btn}
                />
            }
        >
            <p>{props.error}</p>
        </Modal>
    );
};

export default ErrorModal;
