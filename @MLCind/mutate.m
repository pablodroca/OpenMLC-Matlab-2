function [new_ind,fail]=mutate(mlcind,mlc_parameters)
% copyright
    fail=0;
    switch mlc_parameters.individual_type
        case 'tree'
            [newvalue,fail]=mutate_tree(mlcind.value,mlc_parameters);
            new_ind=MLCind;
            new_ind.generate(mlc_parameters,newvalue);
        case 'LGP'
            [newvalue,fail]=mutate_LGP(mlcind.value,mlc_parameters);
            new_ind=MLCind;
            new_ind.generate(mlc_parameters,newvalue);
    end
            










