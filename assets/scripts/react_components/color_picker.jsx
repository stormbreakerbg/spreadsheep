var ColorPicker = React.createClass({
    getDefaultProps: function() {
        return {
            title: '',
            onChange: function(color) { },
            initialColor: '#ffffff',
            colors: [
                '#ffffff', '#000000', '#eeece1', '#1f497d', '#4f81bd', '#c0504d', '#9bbb59', '#8064a2', '#4bacc6', '#f79646', '#ffff00',
                '#f2f2f2', '#7f7f7f', '#ddd9c3', '#c6d9f0', '#dbe5f1', '#f2dcdb', '#ebf1dd', '#e5e0ec', '#dbeef3', '#fdeada', '#fff2ca',
                '#d8d8d8', '#595959', '#c4bd97', '#8db3e2', '#b8cce4', '#e5b9b7', '#d7e3bc', '#ccc1d9', '#b7dde8', '#fbd5b5', '#ffe694',
                '#bfbfbf', '#3f3f3f', '#938953', '#548dd4', '#95b3d7', '#d99694', '#c3d69b', '#b2a2c7', '#a5d0e0', '#fac08f', '#f2c314',
                '#a5a5a5', '#262626', '#494429', '#17365d', '#366092', '#953734', '#76923c', '#5f497a', '#92cddc', '#e36c09', '#c09100',
                '#7f7f7f', '#0c0c0c', '#1d1b10', '#0f243e', '#244061', '#632423', '#4f6128', '#3f3151', '#31859b', '#974806', '#7f6000'
            ]
        };
    },

    getInitialState: function() {
        return {
            color: this.props.initialColor,
            colorBoxVisible: false
        };
    },

    render: function() {
        var style = {
            backgroundColor: this.state.color
        };

        return (
            <div className="color-picker" title={this.props.title}>
                <button onClick={this.toggleColorBox}>
                    <i className="color-preview" style={style}></i>
                </button>
                {this.state.colorBoxVisible ? this.renderColorBox() : ''}
            </div>
        );
    },

    renderColorBox: function() {
        return (
            <ul className="color-box">
                {this.props.colors.map(this.renderColor)}
            </ul>
        );
    },

    renderColor: function(color) {
        var style = {
            backgroundColor: color
        };

        return (
            <li className="color" style={style} onClick={this.selectColor.bind(this, color)}></li>
        );
    },

    selectColor: function(color) {
        this.setState({
            color: color,
            colorBoxVisible: false
        });

        this.props.onChange(color);
    },

    setSelectedColor: function(color) {
        this.setState({
            color: color
        });
    },

    toggleColorBox: function() {
        this.setState({
            colorBoxVisible: !this.state.colorBoxVisible
        });
    }
});