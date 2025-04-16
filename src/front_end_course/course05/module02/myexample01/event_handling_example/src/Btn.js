
function Btn(props) {
    return (
        <button onClick={props.onClick}>
           {props.btnText}
        </button>
    );
}

export default Btn;